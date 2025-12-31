// ==========================================
// FILE: lib/screens/dashboard_screen.dart
// ==========================================

import 'package:clue_player/widgets/batch_card.dart';
import 'package:flutter/material.dart';

import '../data/mock_data.dart';
import '../video_model.dart'; // IMPORT THE DATA MODEL
import '../yt_service.dart'; // IMPORT THE ENGINE

class DashboardScreen extends StatefulWidget {
  final String title;
  final String filterType; // 'ALL', 'LEARN', 'CHILL', 'PRIVATE'

  const DashboardScreen(
      {super.key, required this.title, this.filterType = 'ALL'});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TextEditingController _searchController = TextEditingController();
  final YtService _ytService = YtService(); // START THE ENGINE

  // Use MockData for the video list
  bool _isLoading = false;
  // ignore: unused_field
  String _statusMsg = "";
  // Store the real video results here (search), or use mock data for initial/default display
  List<VideoModel> _realVideos = [];
  final List<Map<String, dynamic>> _mockVideos = MockData.videos;

  // 1. THE SEARCH LOGIC
  Future<void> _handleSearch(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
      _statusMsg = "Scanning Secure Channels...";
    });

    try {
      // CALL THE SERVICE
      final results = await _ytService.searchOrFetch(query);

      setState(() {
        _realVideos = results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _statusMsg = "Connection Failed: $e";
        _isLoading = false;
      });
    }
  }

  // 2. THE DOWNLOAD LOGIC
  void _triggerDownload(VideoModel video) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Initializing Secure Download: ${video.title}")));

    // START DOWNLOAD IN BACKGROUND
    _ytService.downloadVideo(video, (log) {
      // TODO: Replace with logging framework in production
      // print("LOG: $log");
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("✅ Asset Secured in Vault"),
          backgroundColor: Colors.green));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: CustomScrollView(
        slivers: [
          // --- TOP BAR ---
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFF333333)),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onSubmitted: _handleSearch,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search,
                              color: widget.filterType == 'PRIVATE'
                                  ? Colors.red
                                  : const Color(0xFF00AAFF)),
                          hintText: "Search global or offline diary...",
                          hintStyle: TextStyle(color: Colors.grey[600]),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(top: 12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  if (_isLoading)
                    const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Color(0xFF00AAFF))),
                ],
              ),
            ),
          ),

          // --- GRID RESULTS ---
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350,
                mainAxisExtent: 380, // FIX OVERFLOW
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // If search results exist, show them; otherwise, show mock data
                  if (_realVideos.isNotEmpty) {
                    final vid = _realVideos[index];
                    return BatchVideoCard(
                      title: vid.title,
                      description: vid.channel, // Use channel as desc
                      duration: vid.duration,
                      fileSize: "Unknown", // Metadata doesn't always give size
                      thumbnailUrl: vid.thumbnailUrl,
                      category: widget.filterType == 'ALL'
                          ? 'General'
                          : widget.filterType,
                      status: "READY",
                      onAction: () => _triggerDownload(vid), id: '', onFavoriteToggle: () {  }, // WIRE THE BUTTON
                    );
                  } else {
                    final mock = _mockVideos[index];
                    return BatchVideoCard(
                      title: mock['title'],
                      description: mock['channel'],
                      duration: mock['duration'],
                      fileSize: mock['size'] ?? 'Unknown',
                      thumbnailUrl: mock['thumbnailUrl'],
                      category: mock['category'] ?? 'General',
                      status: mock['status'] ?? 'READY',
                      onAction: () {
                        // Optionally, convert to VideoModel if needed for download
                        // _triggerDownload(VideoModel.fromMap(mock));
                      }, id: '', onFavoriteToggle: () {  },
                    );
                  }
                },
                childCount: _realVideos.isNotEmpty
                    ? _realVideos.length
                    : _mockVideos.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
