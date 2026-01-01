// ==========================================
// FILE: ./player/video_player_screen.dart
// MODERNIZED VERSION
// ==========================================

import 'dart:async';

import 'package:clue_player/core/database/schema.dart';
import 'package:clue_player/core/models/media_category.dart';
import 'package:clue_player/core/providers/media_providers.dart';
import 'package:clue_player/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VideoPlayerScreen extends ConsumerStatefulWidget {
  final String videoId;

  const VideoPlayerScreen({super.key, required this.videoId});

  @override
  ConsumerState<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends ConsumerState<VideoPlayerScreen>
    with SingleTickerProviderStateMixin {
  bool _isPlaying = false;
  double _progress = 0.45;
  double _volume = 0.7;
  bool _isMuted = false;
  bool _isFullscreen = false;
  bool _showControls = true;
  late Timer _hideControlsTimer;
  bool _isHovering = false;
  late AnimationController _controlsAnimationController;
  // ignore: unused_field
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controlsAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _showControls = true;
    _startHideTimer();
  }

  void _startHideTimer() {
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      if (mounted && !_isHovering && _isPlaying) {
        _hideControls();
      }
    });
  }

  void _togglePlayPause() {
    setState(() => _isPlaying = !_isPlaying);
    if (!_showControls) _showControlsAnimated();
  }

  void _toggleFullscreen() {
    setState(() => _isFullscreen = !_isFullscreen);
  }

  void _showControlsAnimated() {
    if (!_showControls) {
      setState(() => _showControls = true);
      _controlsAnimationController.forward();
    }
    _startHideTimer();
  }

  void _hideControls() {
    if (_showControls && _isPlaying) {
      _controlsAnimationController.reverse().then((_) {
        if (mounted) setState(() => _showControls = false);
      });
    }
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      if (_isMuted) _volume = 0;
    });
  }

  @override
  void dispose() {
    _hideControlsTimer.cancel();
    _controlsAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videoStream = ref.watch(watchMediaByIdProvider(widget.videoId));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: videoStream.when(
        data: (mediaItem) {
          if (mediaItem == null) {
            return const _PlayerErrorState();
          }

          final video = mediaItem as MediaItem;

          return LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth > 800;

              return MouseRegion(
                onHover: (_) {
                  if (!_isHovering) {
                    setState(() => _isHovering = true);
                    _showControlsAnimated();
                  }
                },
                onExit: (_) {
                  setState(() => _isHovering = false);
                  if (_isPlaying) _startHideTimer();
                },
                child: _isFullscreen
                    ? _buildFullscreenPlayer(video, context)
                    : _buildNormalPlayer(video, context, isWideScreen),
              );
            },
          );
        },
        loading: () => const _PlayerLoadingState(),
        error: (error, stack) => const _PlayerErrorState(),
      ),
    );
  }

  Widget _buildNormalPlayer(
      MediaItem video, BuildContext context, bool isWideScreen) {
    return Column(
      children: [
        Expanded(
          flex: isWideScreen ? 6 : 5,
          child: _buildVideoPlayer(video, context),
        ),
        Expanded(
          flex: isWideScreen ? 4 : 5,
          child: _buildVideoDetails(video, context, isWideScreen),
        ),
      ],
    );
  }

  Widget _buildFullscreenPlayer(MediaItem video, BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildVideoPlayer(video, context),
          Positioned.fill(
            child: AnimatedOpacity(
              opacity: _showControls ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withAlpha(102),
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withAlpha(153),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 32,
            left: 24,
            child: _buildBackButton(context),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildFullscreenControls(video, context),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer(MediaItem video, BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Thumbnail/Video Background
        Container(
          color: Colors.black,
          child: Center(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                video.thumbnailPath ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.surface,
                  child: const Center(
                    child: Icon(Icons.videocam_off,
                        size: 48, color: AppColors.onSurfaceVariant),
                  ),
                ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (mounted) setState(() => _isLoading = false);
                    });
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        // Private Content Overlay
        if (video.category == MediaCategory.private)
          Container(
            color: Colors.black.withAlpha(179),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.lock, size: 64, color: Colors.redAccent),
                  const SizedBox(height: 16),
                  Text(
                    'Private Content',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This content requires age verification',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                ],
              ),
            ),
          ),

        // Play/Pause Center Button
        if (!_isPlaying && _showControls)
          Center(
            child: GestureDetector(
              onTap: _togglePlayPause,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(51),
                  shape: BoxShape.circle,
                ),
                child:
                    const Icon(Icons.play_arrow, size: 48, color: Colors.white),
              ),
            ),
          ),

        // Top Info Bar
        Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: AnimatedOpacity(
            opacity: _showControls ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Row(
              children: [
                _buildCategoryChip(video.category, context),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(128),
                    borderRadius: AppBorderRadius.sm,
                  ),
                  child: Text(
                    _formatDuration(video.durationSeconds),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Progress Bar
        Positioned(
          bottom: _isFullscreen ? 120 : 80,
          left: 16,
          right: 16,
          child: _buildProgressBar(video, context),
        ),

        // Controls
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: AnimatedOpacity(
            opacity: _showControls ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: _buildPlayerControls(video, context),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(MediaCategory category, BuildContext context) {
    final colors = {
      MediaCategory.learning: Colors.blue,
      MediaCategory.chilling: Colors.purple,
      MediaCategory.private: Colors.red,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: colors[category]!.withAlpha(51),
        borderRadius: AppBorderRadius.sm,
        border: Border.all(color: colors[category]!.withAlpha(102)),
      ),
      child: Text(
        _capitalize(category.name),
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: colors[category],
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget _buildProgressBar(MediaItem video, BuildContext context) {
    return Column(
      children: [
        // Time Display
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration((_progress * video.durationSeconds).toInt()),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Text(
                _formatDuration(video.durationSeconds),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Progress Slider
        SliderTheme(
          data: SliderThemeData(
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: Colors.white.withAlpha(51),
            thumbColor: AppColors.primary,
          ),
          child: Slider(
            value: _progress,
            onChanged: (value) {
              setState(() => _progress = value);
            },
            onChangeEnd: (value) {
              setState(() => _progress = value);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPlayerControls(MediaItem video, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(153),
        borderRadius: AppBorderRadius.md,
      ),
      child: Row(
        children: [
          // Playback Controls
          IconButton(
            onPressed: _togglePlayPause,
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.skip_previous, color: Colors.white),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.skip_next, color: Colors.white),
          ),

          const SizedBox(width: 24),

          // Volume Control
          GestureDetector(
            onTap: _toggleMute,
            child: Row(
              children: [
                Icon(
                  _isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 80,
                  child: Slider(
                    value: _isMuted ? 0 : _volume,
                    onChanged: (value) {
                      setState(() {
                        _volume = value;
                        _isMuted = value == 0;
                      });
                    },
                    activeColor: Colors.white,
                    inactiveColor: Colors.white.withAlpha(51),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Playback Speed
          PopupMenuButton<double>(
            icon: const Icon(Icons.speed, color: Colors.white),
            itemBuilder: (context) => [0.5, 0.75, 1.0, 1.25, 1.5, 2.0]
                .map((speed) => PopupMenuItem(
                      value: speed,
                      child: Text('${speed}x'),
                    ))
                .toList(),
            onSelected: (speed) {},
          ),

          const SizedBox(width: 16),

          // Fullscreen Button
          IconButton(
            onPressed: _toggleFullscreen,
            icon: Icon(
              _isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFullscreenControls(MediaItem video, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withAlpha(204),
            Colors.transparent,
          ],
        ),
      ),
      child: Column(
        children: [
          _buildProgressBar(video, context),
          const SizedBox(height: 20),
          Row(
            children: [
              IconButton(
                onPressed: _togglePlayPause,
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                video.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const Spacer(),
              IconButton(
                onPressed: _toggleMute,
                icon: Icon(
                  _isMuted ? Icons.volume_off : Icons.volume_up,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              IconButton(
                onPressed: _toggleFullscreen,
                icon: const Icon(Icons.fullscreen_exit, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _isFullscreen ? context.pop() : Navigator.of(context).pop(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(128),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.arrow_back, color: Colors.white),
      ),
    );
  }

  Widget _buildVideoDetails(
      MediaItem video, BuildContext context, bool isWideScreen) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            video.title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.onBackground,
                  fontWeight: FontWeight.w700,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),

          // Metadata
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.surfaceVariant,
                child: Text(
                  video.title[0].toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lofi Productions',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.onBackground,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${_formatSize(video.encryptedSize)} • ${_formatDate(video.encryptedAt)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                  ),
                ],
              ),
              const Spacer(),
              FilledButton.tonal(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.surfaceVariant,
                  foregroundColor: AppColors.onSurface,
                ),
                child: const Text('Subscribe'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Description
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.surfaceVariant,
              borderRadius: AppBorderRadius.md,
            ),
            child: Text(
              video.description ?? 'No description available',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.onSurfaceVariant,
                    height: 1.6,
                  ),
            ),
          ),
          const SizedBox(height: 24),

          // Action Buttons
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up, size: 18),
                label: const Text('Like'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.share, size: 18),
                label: const Text('Share'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download, size: 18),
                label: const Text('Download'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.bookmark, size: 18),
                label: const Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _capitalize(String text) {
    if (text.isEmpty) return '';
    return text[0].toUpperCase() + text.substring(1);
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

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1048576) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / 1048576).toStringAsFixed(1)} MB';
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    }
    return 'Just now';
  }
}

class _PlayerLoadingState extends StatelessWidget {
  const _PlayerLoadingState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(color: AppColors.primary),
          const SizedBox(height: 16),
          Text(
            'Loading video...',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}

class _PlayerErrorState extends StatelessWidget {
  const _PlayerErrorState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            'Video not found',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.onBackground,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'The requested video could not be loaded',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
