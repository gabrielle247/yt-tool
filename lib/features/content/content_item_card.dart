// ==========================================
// FILE: ./content/content_item_card.dart
// MODERNIZED VERSION
// ==========================================

import 'package:clue_player/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clue_player/core/database/schema.dart';
import 'package:clue_player/core/models/media_category.dart';

class ContentItemCard extends StatefulWidget {
  final MediaItem mediaItem;
  final bool isGridView;
  final VoidCallback? onTap;
  
  const ContentItemCard({
    super.key,
    required this.mediaItem,
    this.isGridView = true,
    this.onTap,
  });

  @override
  State<ContentItemCard> createState() => _ContentItemCardState();
}

class _ContentItemCardState extends State<ContentItemCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap ?? () => context.go('/player/${widget.mediaItem.id}'),
        child: widget.isGridView
            ? _buildGridViewCard()
            : _buildListViewCard(),
      ),
    );
  }

  Widget _buildGridViewCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppBorderRadius.lg,
        border: Border.all(
          color: _isHovering
              ? AppColors.primary.withAlpha(77)
              : AppColors.surfaceVariant,
        ),
        boxShadow: _isHovering
            ? [
                BoxShadow(
                  color: AppColors.primary.withAlpha(26),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withAlpha(26),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
      ),
      child: ClipRRect(
        borderRadius: AppBorderRadius.lg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildThumbnailSection(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _buildContentInfo(),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildListViewCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppBorderRadius.lg,
        border: Border.all(
          color: _isHovering
              ? AppColors.primary.withAlpha(77)
              : AppColors.surfaceVariant,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: _buildThumbnailSection(),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _buildContentInfo(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnailSection() {
    final isPrivate = widget.mediaItem.category == MediaCategory.private;

    return AspectRatio(
      aspectRatio: widget.isGridView ? 16 / 9 : 4 / 3,
      child: Stack(
        children: [
          // Thumbnail Image
          Container(
            color: AppColors.surfaceVariant,
            child: widget.mediaItem.thumbnailPath != null
                ? Image.network(
                    widget.mediaItem.thumbnailPath!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    errorBuilder: (context, error, stackTrace) => const _ThumbnailPlaceholder(),
                  )
                : const _ThumbnailPlaceholder(),
          ),

          // Private Overlay
          if (isPrivate)
            Container(
              color: Colors.black.withAlpha(153),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.lock, color: Colors.white, size: 32),
                    const SizedBox(height: 8),
                    Text(
                      'Private',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Category Badge
          Positioned(
            top: 12,
            left: 12,
            child: _buildCategoryBadge(),
          ),

          // Duration Badge
          Positioned(
            bottom: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(179),
                borderRadius: AppBorderRadius.sm,
              ),
              child: Text(
                _formatDuration(widget.mediaItem.durationSeconds),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Hover Overlay
          if (_isHovering && !isPrivate)
            Container(
              color: Colors.black.withAlpha(77),
              child: Center(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(230),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.play_arrow, color: Colors.white, size: 32),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryBadge() {
    final color = _getCategoryColor(widget.mediaItem.category);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withAlpha(230),
        borderRadius: AppBorderRadius.sm,
      ),
      child: Text(
        _capitalize(widget.mediaItem.category.name),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildContentInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Title and Menu
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.mediaItem.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.onBackground,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: widget.isGridView ? 2 : 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Lofi Productions • ${_formatDate(widget.mediaItem.encryptedAt)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              visualDensity: VisualDensity.compact,
            ),
          ],
        ),

        // Description
        if (widget.isGridView && widget.mediaItem.description != null)
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 12),
            child: Text(
              widget.mediaItem.description!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.onSurfaceVariant,
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

        // Metadata and Actions
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${(widget.mediaItem.encryptedSize / 1000000).toStringAsFixed(1)} MB',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
            FilledButton.tonal(
              onPressed: () {},
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                minimumSize: const Size(0, 36),
              ),
              child: const Text('Download'),
            ),
          ],
        ),
      ],
    );
  }

  Color _getCategoryColor(MediaCategory category) {
    switch (category) {
      case MediaCategory.learning:
        return Colors.blue;
      case MediaCategory.chilling:
        return Colors.purple;
      case MediaCategory.private:
        return Colors.red;
    }
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
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m ${secs}s';
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
    }
    return 'Today';
  }
}

class _ThumbnailPlaceholder extends StatelessWidget {
  const _ThumbnailPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surfaceVariant,
      child: const Center(
        child: Icon(Icons.videocam_off, color: AppColors.onSurfaceVariant, size: 48),
      ),
    );
  }
}