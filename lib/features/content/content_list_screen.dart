// ==========================================
// FILE: ./content/content_list_screen.dart
// MODERNIZED VERSION
// ==========================================

import 'package:clue_player/core/database/schema.dart';
import 'package:clue_player/core/providers/media_providers.dart';
import 'package:clue_player/core/theme/app_theme.dart';
import 'package:clue_player/features/import/add_video_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'content_item_card.dart';

class ContentListScreen extends ConsumerStatefulWidget {
  final String category;

  const ContentListScreen({super.key, required this.category});

  @override
  ConsumerState<ContentListScreen> createState() => _ContentListScreenState();
}

class _ContentListScreenState extends ConsumerState<ContentListScreen> {
  int _activeFilter = 0;
  bool _isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            _buildAppBar(context),
            _buildHeroSection(),
            _buildFiltersSection(),
          ];
        },
        body: _buildContentGrid(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddVideoDialog(),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Import Video'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: AppColors.background,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: MediaQuery.of(context).size.width > 768
          ? null
          : IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
      title: const _SearchBar(),
      actions: [
        IconButton(
          onPressed: () => setState(() => _isGridView = !_isGridView),
          icon: Icon(
            _isGridView ? Icons.view_list : Icons.grid_view,
            color: AppColors.onSurface,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        const _UserAvatar(),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildHeroSection() {
    final categoryData = {
      'all': {
        'title': 'Focus & Unwind',
        'subtitle':
            'A curated sanctuary of videos for deep learning or pure relaxation. Safe, secure, and ready for you.',
      },
      'learning': {
        'title': 'Deep Learning',
        'subtitle':
            'Expand your knowledge with carefully selected educational content.',
      },
      'chilling': {
        'title': 'Relaxation Zone',
        'subtitle': 'Unwind with soothing content designed to relax your mind.',
      },
      'private': {
        'title': 'Private Content',
        'subtitle':
            'User-uploaded content that may be sensitive or restricted.',
      },
    };

    final data = categoryData[widget.category] ?? categoryData['all']!;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['title']!,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColors.onBackground,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              data['subtitle']!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withAlpha(13),
                    Colors.transparent,
                  ],
                ),
                borderRadius: AppBorderRadius.md,
                border: Border.all(color: AppColors.primary.withAlpha(26)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.security, color: AppColors.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Your data is encrypted and stored locally',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFiltersSection() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended for You',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.onBackground,
                    fontWeight: FontWeight.w600,
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
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, int index) {
    final isActive = _activeFilter == index;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        selected: isActive,
        onSelected: (selected) =>
            setState(() => _activeFilter = selected ? index : 0),
        label: Text(label),
        selectedColor: AppColors.primary,
        checkmarkColor: Colors.white,
        labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: isActive ? Colors.white : AppColors.onSurface,
              fontWeight: FontWeight.w500,
            ),
        backgroundColor: AppColors.surfaceVariant,
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.full,
        ),
      ),
    );
  }

  Widget _buildContentGrid() {
    final mediaStream = ref.watch(watchAllMediaProvider);

    return mediaStream.when(
      data: (items) {
        final mediaItems = items.cast<MediaItem>();

        if (mediaItems.isEmpty) {
          return const _EmptyState();
        }

        final filteredItems = mediaItems.where((item) {
          if (widget.category == 'all') return true;
          return item.category.name == widget.category;
        }).toList();

        return _isGridView
            ? _buildGridView(filteredItems)
            : _buildListView(filteredItems);
      },
      loading: () => const _LoadingGrid(),
      error: (error, stack) => Center(
        child: Text('Error: $error'),
      ),
    );
  }

  Widget _buildGridView(List<MediaItem> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        padding: const EdgeInsets.only(bottom: 24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              _calculateCrossAxisCount(MediaQuery.of(context).size.width),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ContentItemCard(
            mediaItem: items[index],
            isGridView: true,
          );
        },
      ),
    );
  }

  Widget _buildListView(List<MediaItem> items) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return ContentItemCard(
          mediaItem: items[index],
          isGridView: false,
        );
      },
    );
  }

  int _calculateCrossAxisCount(double width) {
    if (width > 1200) return 4;
    if (width > 900) return 3;
    if (width > 600) return 2;
    return 1;
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search videos...',
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: AppColors.surfaceVariant,
          border: OutlineInputBorder(
            borderRadius: AppBorderRadius.full,
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 20,
      backgroundColor: AppColors.surfaceVariant,
      child: Icon(Icons.person, color: AppColors.onSurfaceVariant),
    );
  }
}

class _LoadingGrid extends StatelessWidget {
  const _LoadingGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            _calculateCrossAxisCount(MediaQuery.of(context).size.width),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const _LoadingCard();
      },
    );
  }
}

int _calculateCrossAxisCount(double width) {
  if (width > 1200) return 4;
  if (width > 900) return 3;
  if (width > 600) return 2;
  return 1;
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppBorderRadius.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.surfaceVariant,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 20,
                  color: AppColors.surfaceVariant,
                  margin: const EdgeInsets.only(bottom: 8),
                ),
                Container(
                  width: 120,
                  height: 16,
                  color: AppColors.surfaceVariant,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.videocam_off,
              size: 64, color: AppColors.onSurfaceVariant),
          const SizedBox(height: 16),
          Text(
            'No content available',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add some videos to get started',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }
}
