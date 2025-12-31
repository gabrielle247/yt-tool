// ==========================================
// FILE: lib/screens/dashboard_screen.dart
// ==========================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/batch_card.dart';
import '../video_model.dart';
import '../yt_service.dart';

class DashboardScreen extends StatefulWidget {
  final String title;
  final String filterType; // 'ALL', 'LEARN', 'CHILL', 'PRIVATE'

  const DashboardScreen({super.key, required this.title, this.filterType = 'ALL'});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final YtService _ytService = YtService();
  List<VideoModel> _allVideos = [];
  List<VideoModel> _filteredVideos = [];
  bool _isLoading = true;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadVideos();
  }

  Future<void> _loadVideos() async {
    setState(() {
      _isLoading = true;
    });

    // TODO: [HIGH PRIORITY] Connect to real data source here
    // For now, creating mock data to demonstrate the UI functionality
    _allVideos = [
      VideoModel(
        id: "1",
        title: "Midnight Lo-Fi Radio - Beats to...",
        channel: "Lo-Fi Beats",
        duration: "24:00",
        thumbnailUrl: "https://f4.bcbits.com/img/a1962363222_65",
        url: "https://youtube.com/watch?v=lofi123",
        platform: "youtube",
        isCompleted: true,
      ),
      VideoModel(
        id: "2",
        title: "Advanced React Hooks Patterns",
        channel: "React Masters",
        duration: "15:45",
        thumbnailUrl: "https://reactjs.org/logo-og.png",
        url: "https://youtube.com/watch?v=react456",
        platform: "youtube",
        isCompleted: true,
      ),
      VideoModel(
        id: "3",
        title: "4K Forest Ambience Soundscape",
        channel: "Nature Sounds",
        duration: "60:00",
        thumbnailUrl: "https://img.youtube.com/vi/xNN7iTA57jM/maxresdefault.jpg",
        url: "https://youtube.com/watch?v=nature789",
        platform: "youtube",
        isCompleted: false,
      ),
      if (widget.filterType == 'PRIVATE' || widget.filterType == 'ALL')
        VideoModel(
          id: "4",
          title: "Team Strategy Session Recording",
          channel: "Internal Team",
          duration: "08:20",
          thumbnailUrl: "",
          url: "https://internal.company.com/recording",
          platform: "internal",
          isCompleted: false,
        ),
    ];

    _filterVideos();
    setState(() {
      _isLoading = false;
    });
  }

  void _filterVideos() {
    List<VideoModel> videos = List.from(_allVideos);

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      videos = videos.where((video) => 
        video.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        video.channel.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
    }

    // Apply category filter based on widget.filterType
    if (widget.filterType != 'ALL') {
      videos = videos.where((video) {
        String category = _getCategoryFromVideo(video);
        return category.toLowerCase() == widget.filterType.toLowerCase();
      }).toList();
    }

    setState(() {
      _filteredVideos = videos;
    });
  }

  String _getCategoryFromVideo(VideoModel video) {
    // Simple categorization logic - in real app this would come from data
    if (video.title.toLowerCase().contains('react') || 
        video.title.toLowerCase().contains('code') ||
        video.title.toLowerCase().contains('tutorial')) {
      return 'LEARNING';
    } else if (video.title.toLowerCase().contains('lofi') || 
               video.title.toLowerCase().contains('chill') ||
               video.title.toLowerCase().contains('ambient')) {
      return 'CHILLING';
    } else if (video.title.toLowerCase().contains('forest') || 
               video.title.toLowerCase().contains('nature') ||
               video.title.toLowerCase().contains('soundscape')) {
      return 'NATURE';
    } else if (video.platform == 'internal') {
      return 'PRIVATE';
    }
    return 'LEARNING'; // default
  }

  String _getStatusFromVideo(VideoModel video) {
    if (!video.isCompleted) return 'DOWNLOADING';
    if (video.hasError) return 'ERROR';
    return 'READY';
  }

  double _getProgressFromVideo(VideoModel video) {
    if (video.isDownloading) return 0.5; // Mock progress
    return video.isCompleted ? 1.0 : 0.0;
  }

  int _getDaysLeftFromVideo(VideoModel video) {
    // Mock days left calculation - in real app this would come from data
    if (video.title.contains('Lo-Fi')) return 30;
    if (video.title.contains('React')) return 28;
    if (video.title.contains('Forest')) return 0; // expired
    return 15;
  }

  void _handleSearchChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
    _filterVideos();
  }

  void _handleVideoAction(VideoModel video) {
    // TODO: Implement actual video action (play/download/delete)
    if (_getStatusFromVideo(video) == 'READY') {
      // Navigate to video player
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Playing: ${video.title}'),
          backgroundColor: const Color(0xFF00AAFF),
        ),
      );
    } else {
      // Start download
      _downloadVideo(video);
    }
  }

  Future<void> _downloadVideo(VideoModel video) async {
    if (!video.isDownloading) {
      setState(() {
        video.isDownloading = true;
        video.isCompleted = false;
      });
      
      try {
        await _ytService.downloadVideo(video, (log) {
          // Update UI with download progress
          print(log); // In real app, update progress bar
        });
        
        setState(() {
          video.isDownloading = false;
          video.isCompleted = true;
        });
      } catch (e) {
        setState(() {
          video.isDownloading = false;
          video.hasError = true;
          video.errorMessage = e.toString();
        });
      }
    }
  }

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
                        onChanged: _handleSearchChanged,
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  IconButton(
                    onPressed: () {
                      // TODO: Implement notifications
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Notifications coming soon'),
                          backgroundColor: const Color(0xFF00AAFF),
                        ),
                      );
                    }, 
                    icon: Icon(Icons.notifications, color: Colors.grey[400])
                  ),
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
                      widget.title,
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

          // 4. LOADING INDICATOR
          if (_isLoading)
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00AAFF)),
                  ),
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
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index >= _filteredVideos.length) {
                    return null;
                  }
                  
                  VideoModel video = _filteredVideos[index];
                  String category = _getCategoryFromVideo(video);
                  String status = _getStatusFromVideo(video);
                  double progress = _getProgressFromVideo(video);
                  int daysLeft = _getDaysLeftFromVideo(video);

                  return BatchVideoCard(
                    title: video.title,
                    description: video.channel,
                    duration: video.duration,
                    fileSize: status == 'READY' ? "128 MB" : "0 MB", // Mock file size
                    thumbnailUrl: video.thumbnailUrl,
                    category: category,
                    status: status,
                    progress: progress,
                    daysLeft: daysLeft,
                    onAction: () => _handleVideoAction(video),
                  );
                },
                childCount: _filteredVideos.length,
              ),
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