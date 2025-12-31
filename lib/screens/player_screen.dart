// ==========================================
// FILE: lib/screens/player_screen.dart
// ==========================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import '../data/mock_data.dart'; // Import mock data for "Up Next"

class PlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String title;

  const PlayerScreen({super.key, required this.videoUrl, required this.title});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late final Player player;
  late final VideoController controller;
  // ignore: unused_field
  final bool _showControls = true;

  @override
  void initState() {
    super.initState();
    player = Player();
    controller = VideoController(player);
    
    // Auto-play the URL passed, or a fallback if empty
    if (widget.videoUrl.isNotEmpty) {
      player.open(Media(widget.videoUrl));
    } else {
       // Just a safe fallback for locked content
       print("No URL provided, likely locked content.");
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Find metadata for the current video (Simulated)
    final videoMeta = MockData.videos.firstWhere(
      (v) => v['title'] == widget.title, 
      orElse: () => MockData.videos[0]
    );

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(),
        title: Text(widget.title, style: const TextStyle(fontSize: 14)),
      ),
      body: Row(
        children: [
          // 1. MAIN PLAYER AREA (Left)
          Expanded(
            flex: 3,
            child: Column(
              children: [
                // Video Container
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.black,
                    child: Center(
                      child: Video(controller: controller),
                    ),
                  ),
                ),
                // Metadata Section
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    child: ListView(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(color: const Color(0xFF00AAFF).withAlpha(30), borderRadius: BorderRadius.circular(4)),
                              child: Text(videoMeta['category'] ?? "General", style: const TextStyle(color: Color(0xFF00AAFF), fontSize: 10, fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(color: Colors.green.withAlpha(30), borderRadius: BorderRadius.circular(4)),
                              child: const Text("Downloaded", style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(widget.title, style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const CircleAvatar(child: Text("LP")),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(videoMeta['channel'] ?? "Unknown", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                const Text("Offline Available", style: TextStyle(color: Colors.grey, fontSize: 10)),
                              ],
                            ),
                            const Spacer(),
                            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.thumb_up, size: 16), label: const Text("Like"), style: FilledButton.styleFrom(backgroundColor: const Color(0xFF1E1E1E))),
                            const SizedBox(width: 8),
                            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.share, size: 16), label: const Text("Share"), style: FilledButton.styleFrom(backgroundColor: const Color(0xFF1E1E1E))),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(color: const Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            videoMeta['desc'] ?? "No description available.",
                            style: const TextStyle(color: Colors.grey, height: 1.5),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // 2. UP NEXT SIDEBAR (Right)
          Container(
            width: 350,
            decoration: const BoxDecoration(
              color: Color(0xFF161616),
              border: Border(left: BorderSide(color: Color(0xFF333333))),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Up Next", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Switch(value: true, onChanged: (v){}, activeColor: const Color(0xFF00AAFF)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: MockData.videos.length, 
                    itemBuilder: (context, index) {
                      final vid = MockData.videos[index];
                      // Don't show current video in sidebar
                      if (vid['title'] == widget.title) return const SizedBox.shrink();

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          onTap: () {
                             // Switch Video Logic
                             player.open(Media(vid['videoUrl']));
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 100, height: 56,
                                decoration: BoxDecoration(
                                  color: Colors.black, 
                                  borderRadius: BorderRadius.circular(4),
                                  image: DecorationImage(image: NetworkImage(vid['thumbnailUrl']), fit: BoxFit.cover)
                                ),
                                child: const Center(child: Icon(Icons.play_circle_outline, color: Colors.white)),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(vid['title'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12), maxLines: 2),
                                    Text(vid['channel'], style: const TextStyle(color: Colors.grey, fontSize: 10)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}