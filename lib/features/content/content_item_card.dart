import 'package:clue_player/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:clue_player/core/database/schema.dart';
import 'package:clue_player/core/models/media_category.dart';

class ContentItemCard extends StatefulWidget {
  final MediaItem mediaItem;
  
  const ContentItemCard({super.key, required this.mediaItem});

  @override
  State<ContentItemCard> createState() => _ContentItemCardState();
}

class _ContentItemCardState extends State<ContentItemCard> {
  bool _isHovering = false;
  final double _progress = 0.45;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: () {
          context.go('/player/${widget.mediaItem.id}');
        },
        child: Container(
          decoration: BoxDecoration(
            color: kSurfaceCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovering ? kPrimary.withAlpha(77) : kSurfaceCard,
            ),
            boxShadow: _isHovering
                ? [BoxShadow(color: kPrimary.withAlpha(26), blurRadius: 10)]
                : [],
          ),
          child: Column(
            children: [
              _buildThumbnail(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _buildContentInfo(),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          child: Container(
            color: Colors.grey[900],
            child: widget.mediaItem.thumbnailPath != null
                ? Image.network(
                    widget.mediaItem.thumbnailPath!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: _isGridView(context) ? 160 : 120,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(Icons.image_not_supported, color: Colors.grey),
                    ),
                  )
                : const Center(
                    child: Icon(Icons.movie, size: 48, color: Colors.grey),
                  ),
          ),
        ),
        if (widget.mediaItem.category == MediaCategory.private)
          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha(102),
              child: const Center(
                child: Icon(Icons.lock, size: 48, color: Colors.redAccent),
              ),
            ),
          ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(204),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '${widget.mediaItem.durationSeconds ~/ 60}:${(widget.mediaItem.durationSeconds % 60).toString().padLeft(2, '0')}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: _getCategoryColor(widget.mediaItem.category),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              widget.mediaItem.category.name.capitalize(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
        if (_isHovering)
          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha(102),
              child: const Center(
                child: Icon(Icons.play_circle, size: 64, color: Colors.white),
              ),
            ),
          ),
        _buildProgressBar(),
      ],
    );
  }

  bool _isGridView(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > 600 && (width ~/ 300) > 1;
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

  Widget _buildProgressBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 4,
        width: double.infinity,
        color: Colors.grey[800],
        child: FractionallySizedBox(
          widthFactor: _progress,
          heightFactor: 1.0,
          child: Container(
            color: kPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildContentInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.mediaItem.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: _isHovering ? kPrimary : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.verified_user, color: Colors.green, size: 18),
          ],
        ),
        const SizedBox(height: 8),
        if (_isGridView(context))
          Text(
            widget.mediaItem.description ?? 'A soothing collection of beats perfect for late night coding sessions or winding down.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: kTextSecondary,
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.mediaItem.encryptedSize ~/ 1000000} MB',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: kTextSecondary,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.info, size: 20, color: Colors.white),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimary,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.download, size: 16),
                      SizedBox(width: 4),
                      Text('Download', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

extension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}