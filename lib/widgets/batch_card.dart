// ==========================================
// FILE: lib/widgets/batch_card.dart
// ==========================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BatchVideoCard extends StatefulWidget {
  final String id;
  final String title;
  final String description;
  final String duration;
  final String fileSize;
  final String thumbnailUrl;
  final String category;
  final String status; // 'READY', 'EXPIRED', 'LOCKED', 'DOWNLOADING'
  final int daysLeft;
  final bool isFavorite;
  final VoidCallback onAction;
  final VoidCallback onFavoriteToggle;

  const BatchVideoCard({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.fileSize,
    required this.thumbnailUrl,
    required this.category,
    required this.status,
    this.daysLeft = 30,
    this.isFavorite = false,
    required this.onAction,
    required this.onFavoriteToggle,
  });

  @override
  State<BatchVideoCard> createState() => _BatchVideoCardState();
}

class _BatchVideoCardState extends State<BatchVideoCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    Color accentColor = const Color(0xFF00AAFF);
    if (widget.category == 'CHILLING') accentColor = const Color(0xFFC39BD3);
    if (widget.category == 'PRIVATE') accentColor = const Color(0xFFE57373);
    if (widget.category == 'NATURE') accentColor = const Color(0xFF81C784);

    // LOGIC: Watch if Ready, Download if Not
    final bool canWatch = widget.status == 'READY';
    final String btnLabel = canWatch ? "Watch" : "Download";
    final IconData btnIcon = canWatch ? Icons.play_arrow : Icons.download;
    final Color btnColor = canWatch ? Colors.green : const Color(0xFF00AAFF);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovering ? accentColor.withOpacity(0.5) : Colors.white.withAlpha(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: _isHovering ? 12 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- IMAGE HEADER ---
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      widget.thumbnailUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => Container(color: Colors.grey[900], child: const Icon(Icons.broken_image)),
                    ),
                  ),
                ),
                // Category Tag
                Positioned(
                  top: 8, left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: accentColor, borderRadius: BorderRadius.circular(4)),
                    child: Text(widget.category.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ),
                // Favorite Button (Overlay)
                Positioned(
                  top: 0, right: 0,
                  child: IconButton(
                    icon: Icon(
                      widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: widget.isFavorite ? Colors.red : Colors.white,
                    ),
                    onPressed: widget.onFavoriteToggle,
                  ),
                ),
              ],
            ),

            // --- CONTENT BODY ---
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[500], fontSize: 11),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.fileSize, style: TextStyle(color: Colors.grey[600], fontSize: 10)),
                        if (canWatch)
                          Row(
                            children: [
                              const Icon(Icons.timer, size: 12, color: Colors.green),
                              const SizedBox(width: 4),
                              Text("${widget.daysLeft} Days Left", style: const TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // --- ACTION BAR ---
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFF333333))),
              ),
              child: InkWell(
                onTap: widget.onAction,
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: btnColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: btnColor.withOpacity(0.5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(btnIcon, size: 16, color: btnColor),
                      const SizedBox(width: 8),
                      Text(btnLabel.toUpperCase(), style: TextStyle(color: btnColor, fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}