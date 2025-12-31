import 'package:clue_player/core/database/schema.dart';
import 'package:clue_player/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:clue_player/core/services/data_repository.dart';
import 'content_item_card.dart';

class ContentListScreen extends StatefulWidget {
  final String category;
  
  const ContentListScreen({super.key, required this.category});

  @override
  State<ContentListScreen> createState() => _ContentListScreenState();
}

class _ContentListScreenState extends State<ContentListScreen> {
  int _activeFilter = 0;
  bool _isGridView = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: kBackgroundDark,
        body: CustomScrollView(
          slivers: [
            _buildAppBar(),
            _buildHeroSection(),
            _buildFiltersSection(),
            _buildContentGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _isGridView = !_isGridView;
            });
          },
          icon: Icon(_isGridView ? Icons.grid_view : Icons.list, color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            context.go('/settings');
          },
          icon: const Icon(Icons.notifications, color: Colors.white),
        ),
        const SizedBox(width: 16),
        const CircleAvatar(
          radius: 16,
          backgroundColor: kSurfaceCard,
          backgroundImage: NetworkImage(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBhBef68BeoaUsi7pyx6GwaPvZSyWQJcI4fx5RLpkxWDeRg4yIwOs9QCU7tjXRPQ3wQV_odM_qHmIkb72ELjLOZNjdPKdLczl1Ow3ivsmVTFASYf1AUa7lHh7vdxLGqpGeW7SZIIriLJpGlY6PG_yg9XiQ2oG_8rbFc8Z3RvUtL14INGV3n10dnqpEVGZF2ahSj8dSkK2fTfY_EZXOkqkHgIuDfQe-w3jKbi7wkHNtEtUrFni5Sg6c_f3bE97aM3ZkmSqDM_EE9_g',
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildHeroSection() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: const BoxDecoration(
          color: kSurfaceDark,
          border: Border(bottom: BorderSide(color: kSurfaceCard)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.category == 'all' ? 'Focus & Unwind' : 
                  widget.category == 'learning' ? 'Deep Learning' :
                  widget.category == 'chilling' ? 'Relaxation Zone' : 'Private Content',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: kPrimary.withAlpha(51),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: kPrimary.withAlpha(77)),
                  ),
                  child: Text(
                    'SECURE',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: kPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              widget.category == 'all' ? 'A curated sanctuary of videos for deep learning or pure relaxation. Safe, secure, and ready for you.' :
              widget.category == 'learning' ? 'Expand your knowledge with carefully selected educational content.' :
              widget.category == 'chilling' ? 'Unwind with soothing content designed to relax your mind.' : 'User-uploaded content that may be sensitive or restricted.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: kTextSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFiltersSection() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended for You',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFilterChip('All', 0),
                  _buildFilterChip('Most Popular', 1),
                  _buildFilterChip('Newest', 2),
                  _buildFilterChip('Short (<10m)', 3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildFilterChip(String label, int value) {
    final isActive = _activeFilter == value;
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _activeFilter = value;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? kPrimary : kSurfaceCard,
          foregroundColor: isActive ? Colors.white : kTextSecondary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildContentGrid() {
    return Consumer<DataRepository>(
      builder: (context, repository, child) {
        return StreamBuilder<List<MediaItem>>(
          stream: repository.watchAllMedia(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator(color: kPrimary)),
              );
            }
            
            final items = snapshot.data ?? [];
            
            if (items.isEmpty) {
              return const SliverFillRemaining(
                child: Center(
                  child: Text('No content available', style: TextStyle(color: Colors.white54)),
                ),
              );
            }
            
            return SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _isGridView ? (MediaQuery.of(context).size.width ~/ 300) : 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: _isGridView ? 0.7 : 2.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index >= items.length) return null;
                    return ContentItemCard(mediaItem: items[index]);
                  },
                  childCount: items.length,
                ),
              ),
            );
          },
        );
      },
    );
  }
}