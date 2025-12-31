import 'dart:async';
import 'package:clue_player/core/database/schema.dart';
import 'package:clue_player/core/services/data_repository.dart';
import 'package:clue_player/core/models/media_category.dart';
import 'package:clue_player/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// Add String extension for capitalize method
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoId;
  
  const VideoPlayerScreen({super.key, required this.videoId});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  bool _isPlaying = false;
  double _progress = 0.45;
  double _volume = 0.7;
  bool _isMuted = false;
  bool _isFullscreen = false;
  bool _showControls = true;
  late Timer _hideControlsTimer;
  final bool _isLocal = true;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _hideControlsTimer = Timer(const Duration(seconds: 3), _hideControls);
  }

  @override
  void dispose() {
    _hideControlsTimer.cancel();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void _toggleFullscreen() {
    setState(() {
      _isFullscreen = !_isFullscreen;
    });
  }

  void _hideControls() {
    if (_showControls) {
      setState(() {
        _showControls = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundDark,
      body: Consumer<DataRepository>(
        builder: (context, repository, child) {
          // Use FutureBuilder instead of StreamBuilder since watchMediaById doesn't exist
          return FutureBuilder<MediaItem?>(
            future: repository.getMediaById(widget.videoId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData || snapshot.data == null) {
                return const Center(child: CircularProgressIndicator(color: kPrimary));
              }
              
              final video = snapshot.data!;
              
              return LayoutBuilder(
                builder: (context, constraints) {
                  return MouseRegion(
                    onHover: (event) {
                      setState(() {
                        _isHovering = true;
                        if (!_showControls) {
                          _showControls = true;
                          _hideControlsTimer.cancel();
                          _hideControlsTimer = Timer(const Duration(seconds: 3), _hideControls);
                        }
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        _isHovering = false;
                      });
                      _hideControlsTimer.cancel();
                      _hideControlsTimer = Timer(const Duration(seconds: 3), _hideControls);
                    },
                    child: _isFullscreen
                        ? _buildFullscreenPlayer(video, context)
                        : _buildNormalPlayer(video, context),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildNormalPlayer(MediaItem video, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _buildVideoPlayer(video),
        ),
        _buildVideoInfo(video),
        _buildUpNextSection(video), // Pass video parameter
      ],
    );
  }

  Widget _buildFullscreenPlayer(MediaItem video, BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _buildVideoPlayer(video),
          if (_showControls || _isHovering)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _buildPlayerControls(video),
            ),
          if (_showControls || _isHovering)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _buildTopControls(video), // Pass video parameter
            ),
          Positioned(
            top: 30,
            left: 20,
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoPlayer(MediaItem video) {
    return Stack(
      children: [
        Container(
          color: Colors.black,
          child: Center(
            child: AspectRatio(
              aspectRatio: 16/9,
              child: Image.network(
                video.thumbnailPath ?? '',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.movie, size: 48, color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
        if (!_isPlaying)
          Center(
            child: IconButton(
              onPressed: _togglePlayPause,
              icon: const Icon(Icons.play_circle, color: Colors.white, size: 80),
            ),
          ),
        if (_showControls || _isHovering)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildPlayerControls(video),
          ),
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: _getCategoryColor(video.category).withAlpha(204),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              video.category.name.capitalize(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(179),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              _formatDuration(video.durationSeconds),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        if (video.category == MediaCategory.private)
          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha(153),
              child: const Center(
                child: Icon(Icons.lock, size: 64, color: Colors.redAccent),
              ),
            ),
          ),
        Positioned(
          bottom: 60,
          left: 20,
          right: 20,
          child: _buildProgressBar(video), // Pass video parameter
        ),
      ],
    );
  }

  Widget _buildPlayerControls(MediaItem video) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: Colors.black.withAlpha(153),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProgressBar(video), // Pass video parameter
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: _togglePlayPause,
                    icon: Icon(
                      _isPlaying ? Icons.pause_circle : Icons.play_circle,
                      color: Colors.white,
                      size: 36,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_previous, color: Colors.white, size: 30),
                    padding: EdgeInsets.zero,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_next, color: Colors.white, size: 30),
                    padding: EdgeInsets.zero,
                  ),
                  const SizedBox(width: 16),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isMuted = !_isMuted;
                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            _isMuted
                                ? Icons.volume_off
                                : _volume > 0.7
                                    ? Icons.volume_up
                                    : _volume > 0.3
                                        ? Icons.volume_down
                                        : Icons.volume_mute,
                            color: Colors.white,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 60,
                            child: Slider(
                              value: _isMuted ? 0 : _volume,
                              max: 1.0,
                              min: 0.0,
                              onChanged: (value) {
                                setState(() {
                                  _volume = value;
                                  _isMuted = value == 0;
                                });
                              },
                              activeColor: kPrimary,
                              inactiveColor: Colors.white30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  if (_isLocal)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withAlpha(51),
                        border: Border.all(color: Colors.green.withAlpha(102)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.download_done, color: Colors.green, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            'Playing from Local Vault',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings, color: Colors.white),
                    padding: EdgeInsets.zero,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.picture_in_picture_alt, color: Colors.white),
                    padding: EdgeInsets.zero,
                  ),
                  IconButton(
                    onPressed: _toggleFullscreen,
                    icon: Icon(
                      _isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopControls(MediaItem video) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.black.withAlpha(153),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (_isFullscreen) {
                context.pop();
              } else {
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
            padding: EdgeInsets.zero,
          ),
          Text(
            '${(_progress * video.durationSeconds).toInt() ~/ 60}:${((_progress * video.durationSeconds).toInt() % 60).toString().padLeft(2, '0')} / ${_formatDuration(video.durationSeconds)}',
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(MediaItem video) {
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(3),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTapDown: (details) {
                    final pos = details.localPosition.dx / constraints.maxWidth;
                    setState(() {
                      _progress = pos.clamp(0.0, 1.0);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [kPrimary, Colors.blue],
                      ),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    width: constraints.maxWidth * _progress,
                  ),
                ),
              ),
              if (_isHovering)
                Positioned(
                  left: constraints.maxWidth * _progress - 8,
                  top: -12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      '${((_progress * video.durationSeconds).toInt() ~/ 60)}:${(((_progress * video.durationSeconds).toInt() % 60)).toString().padLeft(2, '0')}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildVideoInfo(MediaItem video) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: kSurfaceDark,
        border: Border(top: BorderSide(color: kSurfaceCard)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  video.title,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: kSurfaceCard,
                backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBhBef68BeoaUsi7pyx6GwaPvZSyWQJcI4fx5RLpkxWDeRg4yIwOs9QCU7tjXRPQ3wQV_odM_qHmIkb72ELjLOZNjdPKdLczl1Ow3ivsmVTFASYf1AUa7lHh7vdxLGqpGeW7SZIIriLJpGlY6PG_yg9XiQ2oG_8rbFc8Z3RvUtL14INGV3n10dnqpEVGZF2ahSj8dSkK2fTfY_EZXOkqkHgIuDfQe-w3jKbi7wkHNtEtUrFni5Sg6c_f3bE97aM3ZkmSqDM_EE9_g',
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lofi Productions',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '24,532 views • Downloaded on Oct 24, 2023',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: kTextSecondary,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSurfaceCard,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Subscribe'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kSurfaceCard,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'A soothing collection of beats perfect for late night coding sessions or winding down. This video is stored locally on your device for seamless playback without buffering. Enjoy high-fidelity audio powered by media_kit integration.\n\nTracklist available in the comments.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: kTextSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up, color: Colors.white),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share, color: Colors.white),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.download, color: Colors.white),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUpNextSection(MediaItem currentVideo) {
    return Container(
      color: kBackgroundDark,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Up Next',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Autoplay',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: kTextSecondary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                    activeThumbColor: kPrimary,
                    thumbColor: WidgetStateProperty.all(Colors.white),
                    trackOutlineColor: WidgetStateProperty.all(kSurfaceCard),
                    trackColor: WidgetStateProperty.all(kSurfaceCard),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 500,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildUpNextCard(index);
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildUpNextCard(int index) {
    final titles = [
      'Advanced React Hooks Patterns',
      '4K Forest Ambience Soundscape',
      'Visual Meditation Loop',
      'Productivity Systems Explained',
      'Digital Waves: Abstract Art History'
    ];
    
    final thumbnails = [
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD2XqIwLXlfWgM_gv6A8hPfpTxb_WnDmmlQ2MG1neJo--UwmMYv4tspfzz7r97TEBXLKhulnjAd82Fj_PtuPLWXhh2pu28jL9rxLdDxXuu5rnBDM6KGgx9KOjdLQlqlbuJ5cRAr-8N2sdPvqjxROsrwG8FvEoIZgalx_5GrUuMiPWMFra7lkvOzUpQDjCL06tE-u7vo_N8485GNc2xPWFRzJ6KUyQKSHFT6NsIePt3EAO4x0D31Y7f6gL2SiTZNrucDJEI0-PXdXQ',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAnJ39MmuzpG6wbkF9rru-IWb8jRI5lx5SRSNv9kJ_llviZ8BCwjTgFSnfjK2ahJhgLp4O7-5bUuVandiw_5-QRWALpmc38kBNswCJBT8d5VAPpHjYFTFqPksEyH7CmwdBIowLahNBnXpXN26KXxKPispCYxnPdcw9u1ycsVcklVHsJ_LTt2EuOZ_iBkbWvFlIcEnMcEJ5twkq6YfEYxgwRCyMxZMh2bEvMumh0bPE5XNzY2xDIv8E-fswa_Xogc4UaTfxwbvtUXg',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCO7DmubmoDV51lkQRSLLJ92HSu2mk7HyxNqFK5hP5EFFsMGZjPYoXd4SkBRySfpp2qSmr66qzvVWfW-WjprWvMEnTMi470YExucQIXJzFvpgOUuWGyvnJ6__3EdrFBjinS9cGtCcLL8QDVBgaILIPU9LaoTGOm7IG8HzztSMf11cr9XmDAm_wvlmZuEIR5LuZk4jUP7sN_qhJiw-ywXpqIAN5o6sC35uqn81F6fD_E5L2-qCVtoM2jKa7YpkJWTUyt7xlgjKmF1Q',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCh_IqvbjjU-RaFegvcB2CO5DjaF0m3-8aKbTQmxtA1ecmV_je0G0490gscaXFUl6KeCWkFR1RWxQBi9OXaOpk8vhAod-Yz98JcJn_5S3c7eQNSmdIHpqPomG0QZYmdpjd0xfJENk9QAaHIaniHfOQwETE6TFmjLEkGcoi8EGO2zseviaMePXR4PuM0lfqnLkrjVWWpn-alNy2AXZqgRe0duVJpTlG3gsiQrX0Bv9pBwEQbQ5ftrxpGhE8N4R5idjgDpGiMVf9yXw',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuDgmUUy0cj-LMmW_1RjzD1IMXOGOvxWhdVt2t1sLfYbsors0cNUyidrgEN5BnTkMAnMp8ImePofHQwXMhOGn-WL7LgrR6JGrqpkiiF6mDDdS5xrZbJM78qFXAFGkzpdzohKEipjUyKZferKpDDvzW2NTEZ5-bHZKz7w5_t_CxAS6OnK1h3yvlrXa6bWFmjHXTEQijjXe5pREnByR-WL_UYls5XgLvs9CjAMa2qV39Ak0ALKvlDjW4WtybRMYYvSFksAAfNhptWECw',
    ];
    
    final durations = ['15:45', '60:00', '05:00', '32:15', '12:30'];
    
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        color: kSurfaceCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    color: Colors.grey[900],
                  ),
                  child: Stack(
                    children: [
                      Image.network(
                        thumbnails[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) => const Center(
                          child: Icon(Icons.image_not_supported, color: Colors.grey),
                        ),
                      ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black.withAlpha(179),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            durations[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titles[index],
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      index == 0 ? 'CodeMastery' : 
                      index == 1 ? 'Nature Sounds' :
                      index == 2 ? 'Mindful Tech' :
                      index == 3 ? 'LifeHacker Pro' : 'Art Explained',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: kTextSecondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      index == 0 ? '85K views • 2 days ago' :
                      index == 1 ? '1.2M views • 1 year ago' :
                      index == 2 ? '12K views • 5 hours ago' :
                      index == 3 ? '205K views • 3 weeks ago' : '45K views • 1 month ago',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: kTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
      // Added default case
    }
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(1, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}