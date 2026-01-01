import 'dart:io';

import 'package:clue_player/core/models/media_category.dart';
import 'package:clue_player/core/providers/media_providers.dart';
import 'package:clue_player/core/providers/scraper_providers.dart';
import 'package:clue_player/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

class AddVideoDialog extends ConsumerStatefulWidget {
  const AddVideoDialog({super.key});

  @override
  ConsumerState<AddVideoDialog> createState() => _AddVideoDialogState();
}

class _AddVideoDialogState extends ConsumerState<AddVideoDialog> {
  final _urlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  MediaCategory _selectedCategory = MediaCategory.learning;
  bool _isLoading = false;
  String? _errorMessage;
  Map<String, dynamic>? _metadata;

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  Future<void> _fetchMetadata() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _metadata = null;
    });

    try {
      final scraper = ref.read(mediaScraperServiceProvider);
      final metadata =
          await scraper.fetchVideoMetadata(_urlController.text.trim());

      setState(() {
        _metadata = metadata;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to fetch video: ${e.toString()}';
        _isLoading = false;
      });
      debugPrint('Error fetching metadata: $e');
    }
  }

  Future<void> _importVideo() async {
    if (_metadata == null) return;

    setState(() => _isLoading = true);

    try {
      // Get app documents directory
      final docsDir = await getApplicationDocumentsDirectory();
      final videosDir = Directory('${docsDir.path}/clue_player/videos');
      if (!await videosDir.exists()) {
        await videosDir.create(recursive: true);
      }

      final scraper = ref.read(mediaScraperServiceProvider);
      final repository = ref.read(dataRepositoryProvider);

      // Download the video
      final videoId = _metadata!['id'] as String;
      await scraper.downloadVideo(
        _urlController.text.trim(),
        videosDir.path,
        filename: videoId,
      );

      // Find the downloaded file
      final downloadedFile = File('${videosDir.path}/$videoId.mp4');

      if (!await downloadedFile.exists()) {
        throw Exception('Downloaded file not found');
      }

      final fileSize = await downloadedFile.length();

      // Save to database
      await repository.addMediaItem(
        id: videoId,
        title: _metadata!['title'] as String,
        category: _selectedCategory,
        sourceHash: videoId,
        encryptedPath: downloadedFile.path,
        encryptionKeyId: 'none',
        encryptedSize: fileSize,
        encryptedAt: DateTime.now(),
        durationSeconds: (_metadata!['duration'] as num?)?.toInt() ?? 0,
        description: _metadata!['description'] as String?,
        thumbnailPath: _metadata!['thumbnail'] as String?,
      );

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Video imported: ${_metadata!['title']}'),
            backgroundColor: AppColors.primary,
          ),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to import video: ${e.toString()}';
        _isLoading = false;
      });
      debugPrint('Error importing video: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                children: [
                  const Icon(Icons.add_circle,
                      color: AppColors.primary, size: 32),
                  const SizedBox(width: 12),
                  Text(
                    'Import Video',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.onBackground,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                    color: AppColors.onSurfaceVariant,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Form
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // URL Input
                    TextFormField(
                      controller: _urlController,
                      decoration: const InputDecoration(
                        labelText: 'Video URL',
                        hintText: 'https://youtube.com/watch?v=...',
                        prefixIcon: Icon(Icons.link),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a URL';
                        }
                        if (!value.startsWith('http')) {
                          return 'Please enter a valid URL';
                        }
                        return null;
                      },
                      enabled: !_isLoading,
                    ),
                    const SizedBox(height: 16),

                    // Category Selection
                    DropdownButtonFormField<MediaCategory>(
                      initialValue: _selectedCategory,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        prefixIcon: Icon(Icons.category),
                        border: OutlineInputBorder(),
                      ),
                      items: MediaCategory.values.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(_getCategoryLabel(category)),
                        );
                      }).toList(),
                      onChanged: _isLoading
                          ? null
                          : (value) {
                              if (value != null) {
                                setState(() => _selectedCategory = value);
                              }
                            },
                    ),
                    const SizedBox(height: 16),

                    // Fetch Metadata Button
                    if (_metadata == null)
                      FilledButton.icon(
                        onPressed: _isLoading ? null : _fetchMetadata,
                        icon: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Icon(Icons.search),
                        label: Text(
                            _isLoading ? 'Fetching...' : 'Fetch Video Info'),
                      ),

                    // Error Message
                    if (_errorMessage != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.error, color: Colors.red),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _errorMessage!,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    // Metadata Preview
                    if (_metadata != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceVariant,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Thumbnail
                            if (_metadata!['thumbnail'] != null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  _metadata!['thumbnail'] as String,
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 120,
                                      color: AppColors.surface,
                                      child: const Icon(Icons.broken_image),
                                    );
                                  },
                                ),
                              ),
                            const SizedBox(height: 12),

                            // Title
                            Text(
                              _metadata!['title'] as String,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppColors.onBackground,
                                    fontWeight: FontWeight.w600,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),

                            // Uploader and Duration
                            Row(
                              children: [
                                const Icon(Icons.person,
                                    size: 16,
                                    color: AppColors.onSurfaceVariant),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    _metadata!['uploader'] as String? ??
                                        'Unknown',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: AppColors.onSurfaceVariant,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Icon(Icons.access_time,
                                    size: 16,
                                    color: AppColors.onSurfaceVariant),
                                const SizedBox(width: 4),
                                Text(
                                  _formatDuration(
                                      (_metadata!['duration'] as num?)
                                              ?.toInt() ??
                                          0),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: AppColors.onSurfaceVariant,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Import Button
                      FilledButton.icon(
                        onPressed: _isLoading ? null : _importVideo,
                        icon: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    strokeWidth: 2, color: Colors.white),
                              )
                            : const Icon(Icons.download),
                        label: Text(
                            _isLoading ? 'Importing...' : 'Download & Import'),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getCategoryLabel(MediaCategory category) {
    switch (category) {
      case MediaCategory.learning:
        return 'Learning';
      case MediaCategory.chilling:
        return 'Chilling';
      case MediaCategory.private:
        return 'Private';
    }
  }

  String _formatDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final secs = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
    }
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }
}
