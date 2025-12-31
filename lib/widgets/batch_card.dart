// ==========================================
// FILE: lib/widgets/batch_card.dart
// ==========================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BatchVideoCard extends StatelessWidget {
  final String title;
  final String description;
  final String duration;
  final String fileSize;
  final String thumbnailUrl;
  final String category; // 'LEARNING', 'CHILLING', 'PRIVATE'
  final String status; // 'READY', 'EXPIRED', 'LOCKED', 'DOWNLOADING'
  final double? progress; // For downloading state
  final int daysLeft; // For 'Time Bomb' logic
  final VoidCallback onAction;

  const BatchVideoCard({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
    required this.fileSize,
    required this.thumbnailUrl,
    required this.category,
    required this.status,
    this.daysLeft = 30,
    this.progress,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    // Color Logic based on Category
    Color accentColor = const Color(0xFF00AAFF); // Default Blue
    if (category == 'CHILLING') accentColor = const Color(0xFFC39BD3); // Purple-ish
    if (category == 'PRIVATE') accentColor = const Color(0xFFE57373); // Red
    if (category == 'NATURE') accentColor = const Color(0xFF81C784); // Green

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withAlpha(20)),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 8, offset: const Offset(0, 4)),
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
                    thumbnailUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (c, o, s) => Container(color: Colors.grey[900]),
                  ),
                ),
              ),
              // Category Tag
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    category.toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Duration Badge
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(200),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    duration,
                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Locked/Expired Overlay
              if (status == 'EXPIRED' || status == 'LOCKED')
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(150),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            status == 'LOCKED' ? Icons.lock : Icons.history,
                            color: Colors.white,
                            size: 32,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            status,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2),
                          )
                        ],
                      ),
                    ),
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
                  // Title
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Description
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey[500], fontSize: 11),
                  ),
                  const Spacer(),
                  // Footer Info (Size & Days Left)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(fileSize, style: TextStyle(color: Colors.grey[600], fontSize: 10)),
                      if (status == 'READY')
                        Row(
                          children: [
                            const Icon(Icons.timer, size: 12, color: Colors.green),
                            const SizedBox(width: 4),
                            Text(
                              "$daysLeft Days Left",
                              style: const TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.info_outline, color: Colors.grey[600], size: 18),
                _buildActionButton(context, accentColor),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, Color color) {
    String label = "Download";
    IconData icon = Icons.download;
    Color btnColor = const Color(0xFF00AAFF);

    if (status == 'READY') {
      label = "Play";
      icon = Icons.play_arrow;
      btnColor = Colors.green;
    } else if (status == 'EXPIRED') {
      label = "Renew";
      icon = Icons.refresh;
      btnColor = Colors.orange;
    } else if (status == 'LOCKED') {
      label = "Unlock";
      icon = Icons.lock_open;
      btnColor = Colors.grey;
    }

    return InkWell(
      onTap: onAction,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: btnColor.withAlpha(30),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: btnColor.withAlpha(100)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 14, color: btnColor),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(color: btnColor, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}