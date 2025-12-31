// ==========================================
// FILE: lib/screens/dashboard_screen.dart
// ==========================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/batch_card.dart';

class DashboardScreen extends StatelessWidget {
  final String title;
  final String filterType; // 'ALL', 'LEARN', 'CHILL', 'PRIVATE'

  const DashboardScreen({super.key, required this.title, this.filterType = 'ALL'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: CustomScrollView(
        slivers: [
          // 1. TOP BAR (Search & Profile)
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.grey[600], size: 20),
                          hintText: "Search your vault...",
                          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 13),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(top: 8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  IconButton(onPressed: (){}, icon: Icon(Icons.notifications, color: Colors.grey[400])),
                  const SizedBox(width: 16),
                  const CircleAvatar(
                    backgroundColor: Color(0xFF00AAFF),
                    radius: 16,
                    child: Text("NG", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),

          // 2. HERO BANNER
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0D47A1), Color(0xFF1976D2)], // Deep Blue Gradient
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: NetworkImage("https://www.transparenttextures.com/patterns/cubes.png"), // Subtle pattern
                  opacity: 0.1,
                  repeat: ImageRepeat.repeat,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "A curated sanctuary of videos for deep learning or pure relaxation.\nSafe, secure, and ready for you.",
                      style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 3. FILTER PILLS
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Row(
                children: [
                  Text("Your Vault", style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                  const Spacer(),
                  _buildFilterChip("All", true),
                  _buildFilterChip("Downloaded", false),
                  _buildFilterChip("Expiring Soon", false),
                  _buildFilterChip("Expired", false),
                ],
              ),
            ),
          ),

          // 4. VIDEO GRID
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350, // Responsive Card Width
                mainAxisExtent: 320, // Card Height
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
              ),
              delegate: SliverChildListDelegate([
                // MOCK DATA MATCHING IMAGE
                BatchVideoCard(
                  title: "Midnight Lo-Fi Radio - Beats to...",
                  description: "A soothing collection of beats perfect for late night...",
                  duration: "24:00",
                  fileSize: "128 MB",
                  thumbnailUrl: "https://f4.bcbits.com/img/a1962363222_65", // Mock
                  category: "CHILLING",
                  status: "READY",
                  daysLeft: 30,
                  onAction: () {},
                ),
                BatchVideoCard(
                  title: "Advanced React Hooks Patterns",
                  description: "Master useEffect and useMemo with these...",
                  duration: "15:45",
                  fileSize: "0 MB",
                  thumbnailUrl: "https://reactjs.org/logo-og.png",
                  category: "LEARNING",
                  status: "READY",
                  daysLeft: 28,
                  onAction: () {},
                ),
                BatchVideoCard(
                  title: "4K Forest Ambience Soundscape",
                  description: "Immersive nature sounds for deep focus or sleep...",
                  duration: "60:00",
                  fileSize: "500 MB",
                  thumbnailUrl: "https://img.youtube.com/vi/xNN7iTA57jM/maxresdefault.jpg",
                  category: "NATURE",
                  status: "EXPIRED",
                  onAction: () {},
                ),
                if (filterType == 'PRIVATE' || filterType == 'ALL')
                BatchVideoCard(
                  title: "Team Strategy Session Recording",
                  description: "Confidential internal meeting discussing Q4...",
                  duration: "08:20",
                  fileSize: "45 MB",
                  thumbnailUrl: "", // Empty for lock icon
                  category: "PRIVATE",
                  status: "LOCKED",
                  onAction: () {},
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF00AAFF) : const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[500],
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}