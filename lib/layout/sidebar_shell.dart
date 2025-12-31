// ==========================================
// FILE: lib/layout/sidebar_shell.dart
// ==========================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SidebarShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const SidebarShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Row(
        children: [
          // --- LEFT SIDEBAR ---
          Container(
            width: 250,
            decoration: const BoxDecoration(
              color: Color(0xFF1E1E1E),
              border: Border(right: BorderSide(color: Color(0xFF333333))), // Added sharp border
            ),
            child: Column(
              children: [
                // BRAND HEADER (UPDATED TO CLUE PLAYER)
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00AAFF).withAlpha(30), // Subtle glow
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xFF00AAFF), width: 1.5),
                        ),
                        child: const Icon(Icons.shield, color: Color(0xFF00AAFF), size: 18),
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Clue Player",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          Text(
                            "Moderated Safe App",
                            style: GoogleFonts.inter(
                              color: Colors.grey[500],
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Divider(color: Color(0xFF333333), height: 1),
                const SizedBox(height: 16),

                // NAVIGATION ITEMS
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    children: [
                      _buildSectionTitle("MAIN LIBRARY"),
                      _buildNavItem(0, "All Videos", Icons.grid_view_rounded),
                      _buildNavItem(1, "Learning", Icons.school_outlined),
                      _buildNavItem(2, "Chilling", Icons.nights_stay_outlined),
                      _buildNavItem(3, "Private Vault", Icons.lock_outline),
                      
                      const SizedBox(height: 32),
                      _buildSectionTitle("MY COLLECTIONS"),
                      _buildNavItem(4, "Favorites", Icons.favorite_border, isStatic: true),
                      _buildNavItem(5, "Watch Later", Icons.history, isStatic: true),
                      _buildNavItem(6, "Downloads", Icons.download_done, isStatic: true),
                    ],
                  ),
                ),

                // SAFE MODE BADGE (Refined)
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D1826), 
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF1565C0).withAlpha(80)),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10, offset: const Offset(0, 4))
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.verified_user, color: Color(0xFF00AAFF), size: 16),
                          SizedBox(width: 8),
                          Text(
                            "Safe Mode Active",
                            style: TextStyle(color: Color(0xFF00AAFF), fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Links are verified secure. External tracking disabled.",
                        style: TextStyle(color: Colors.grey[500], fontSize: 10, height: 1.4),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          // --- MAIN CONTENT AREA ---
          Expanded(
            child: navigationShell, 
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 12, top: 8),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[600], 
          fontSize: 10, 
          fontWeight: FontWeight.bold, 
          letterSpacing: 1.5
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label, IconData icon, {bool isStatic = false}) {
    final bool isSelected = !isStatic && navigationShell.currentIndex == index;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF00AAFF).withAlpha(25) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isSelected ? Border.all(color: const Color(0xFF00AAFF).withAlpha(50)) : Border.all(color: Colors.transparent),
      ),
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        leading: Icon(
          icon, 
          color: isSelected ? const Color(0xFF00AAFF) : Colors.grey[500], 
          size: 20
        ),
        title: Text(
          label,
          style: GoogleFonts.inter(
            color: isSelected ? Colors.white : Colors.grey[400],
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
        onTap: isStatic ? null : () => navigationShell.goBranch(index),
        trailing: isSelected 
          ? Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFF00AAFF), shape: BoxShape.circle)) 
          : null,
      ),
    );
  }
}