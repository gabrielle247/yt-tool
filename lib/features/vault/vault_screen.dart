import 'package:clue_player/core/database/schema.dart';
import 'package:clue_player/core/models/media_category.dart';
import 'package:clue_player/core/providers/media_providers.dart';
import 'package:clue_player/core/utils/string_extensions.dart';
import 'package:clue_player/features/import/add_video_dialog.dart';
import 'package:clue_player/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VaultScreen extends ConsumerStatefulWidget {
  const VaultScreen({super.key});

  @override
  ConsumerState<VaultScreen> createState() => _VaultScreenState();
}

class _VaultScreenState extends ConsumerState<VaultScreen>
    with TickerProviderStateMixin {
  int _activeFilter = 0;
  int _activeSort = 0;
  bool _isGridView = true;
  bool _isHovering = false;
  late TabController _tabController;

  bool? get isDownloaded => null;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
            _buildStorageInfo(),
            _buildFiltersSection(),
            _buildContentGrid(),
          ],
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
          backgroundColor: kPrimary,
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
          icon: Icon(_isGridView ? Icons.grid_view : Icons.list,
              color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
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
                  'My Downloads',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Manage your secure offline content and subscriptions.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: kTextSecondary,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStorageInfo() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.blueGrey[900],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kPrimary.withAlpha(77)),
          gradient: LinearGradient(
            colors: [Colors.blueGrey[900]!, Colors.blueGrey[800]!],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.cloud, color: kPrimary, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Vault Storage',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '12GB / 50GB',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: kTextSecondary,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: kSurfaceCard,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Container(
                          width: constraints.maxWidth * 0.24,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [kPrimary, Colors.blue],
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kPrimary.withAlpha(51),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: kPrimary.withAlpha(102)),
              ),
              child: const Icon(Icons.info, color: kPrimary, size: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFiltersSection() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: kSurfaceDark,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kSurfaceCard),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Chips
            SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFilterChip(Icons.grid_view, 'All', 0,
                      isActive: _activeFilter == 0),
                  _buildFilterChip(Icons.school, 'Learning', 1,
                      isActive: _activeFilter == 1),
                  _buildFilterChip(Icons.weekend, 'Chilling', 2,
                      isActive: _activeFilter == 2),
                  _buildFilterChip(Icons.lock, 'Private', 3,
                      isActive: _activeFilter == 3),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Sort and Actions
            Row(
              children: [
                Text(
                  'Sort by:',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: kTextSecondary,
                      ),
                ),
                const SizedBox(width: 8),
                DropdownButton<int>(
                  value: _activeSort,
                  onChanged: (value) {
                    setState(() {
                      _activeSort = value!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(value: 0, child: Text('Date')),
                    DropdownMenuItem(value: 1, child: Text('Size')),
                    DropdownMenuItem(value: 2, child: Text('Duration')),
                  ],
                  underline: Container(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                  dropdownColor: kSurfaceDark,
                  iconEnabledColor: Colors.white,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(IconData icon, String label, int value,
      {required bool isActive}) {
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
          shadowColor: Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(icon, size: 18),
            const SizedBox(width: 6),
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    fontSize: 14,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentGrid() {
    final mediaStream = ref.watch(watchAllMediaProvider);

    return mediaStream.when(
      data: (items) {
        final mediaItems = items.cast<MediaItem>();
        final activeItems = mediaItems
            .where((item) =>
                _activeFilter == 0 ||
                (_activeFilter == 1 &&
                    item.category == MediaCategory.learning) ||
                (_activeFilter == 2 &&
                    item.category == MediaCategory.chilling) ||
                (_activeFilter == 3 && item.category == MediaCategory.private))
            .toList();

        if (activeItems.isEmpty) {
          return const SliverFillRemaining(
            child: Center(
              child: Text('No content available',
                  style: TextStyle(color: Colors.white54)),
            ),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  _isGridView ? (MediaQuery.of(context).size.width ~/ 300) : 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: _isGridView ? 0.7 : 2.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index >= activeItems.length) return null;
                return _buildVaultCard(activeItems[index]);
              },
              childCount: activeItems.length,
            ),
          ),
        );
      },
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator(color: kPrimary)),
      ),
      error: (error, stack) => SliverFillRemaining(
        child: Center(
          child:
              Text('Error: $error', style: const TextStyle(color: Colors.red)),
        ),
      ),
    );
  }

  Widget _buildVaultCard(MediaItem mediaItem) {
    const isExpired =
        false; // In a real app, this would be based on expiration date
    final isExpiringSoon = mediaItem.title.contains('System'); // Demo data

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: () {
          context.go('/player/${mediaItem.id}');
        },
        child: Container(
          decoration: BoxDecoration(
            color: kSurfaceCard,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isExpiringSoon
                  ? Colors.red
                  : _isHovering
                      ? kPrimary.withAlpha(128)
                      : kSurfaceCard,
            ),
            boxShadow: _isHovering
                ? [BoxShadow(color: kPrimary.withAlpha(51), blurRadius: 10)]
                : [],
          ),
          child: Column(
            children: [
              _buildThumbnailSection(mediaItem, isExpired, isExpiringSoon),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _buildContentInfo(mediaItem, isExpired, isExpiringSoon),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnailSection(
      MediaItem mediaItem, bool isExpired, bool isExpiringSoon) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Container(
            color: Colors.grey[900],
            child: mediaItem.thumbnailPath != null
                ? Image.network(
                    mediaItem.thumbnailPath!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: _isGridView ? 180 : 140,
                    errorBuilder: (context, error, stackTrace) => const Center(
                      child:
                          Icon(Icons.image_not_supported, color: Colors.grey),
                    ),
                  )
                : const Center(
                    child: Icon(Icons.movie, size: 48, color: Colors.grey),
                  ),
          ),
        ),
        if (mediaItem.category == MediaCategory.private)
          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha(102),
              child: const Center(
                child: Icon(Icons.lock, size: 48, color: Colors.redAccent),
              ),
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
              '${mediaItem.durationSeconds ~/ 60}:${(mediaItem.durationSeconds % 60).toString().padLeft(2, '0')}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: _getCategoryColor(mediaItem.category).withAlpha(204),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              mediaItem.category.name.capitalize(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
        if (isExpired) _buildExpiredOverlay(),
        if (isExpiringSoon) _buildExpiringOverlay(),
        if (isDownloaded! && !_isGridView) _buildDownloadBadge(),
        if (_isHovering)
          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha(77),
              child: const Center(
                child: Icon(Icons.play_circle, size: 64, color: Colors.white),
              ),
            ),
          ),
        if (_isGridView && !isExpired) _buildProgressBar(),
      ],
    );
  }

  Widget _buildExpiredOverlay() {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withAlpha(179),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.timer_off, color: Colors.red, size: 48),
            const SizedBox(height: 8),
            Text(
              'Expired',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.autorenew, size: 18),
                  SizedBox(width: 8),
                  Text('Renew Access', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpiringOverlay() {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.red.withAlpha(230),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red.withAlpha(128)),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withAlpha(77),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.hourglass_bottom, color: Colors.white, size: 14),
            SizedBox(width: 4),
            Text(
              'Expiring in 2h',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDownloadBadge() {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.green.withAlpha(204),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.download_done, color: Colors.white, size: 14),
            SizedBox(width: 4),
            Text(
              'Downloaded',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 4,
        width: double.infinity,
        color: Colors.grey[800],
        child: FractionallySizedBox(
          widthFactor: 0.65,
          heightFactor: 1.0,
          child: Container(
            color: kPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildContentInfo(
      MediaItem mediaItem, bool isExpired, bool isExpiringSoon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                mediaItem.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: _isHovering ? kPrimary : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (!isExpired)
              IconButton(
                onPressed: () {},
                icon:
                    const Icon(Icons.more_vert, size: 20, color: Colors.white),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
          ],
        ),
        const SizedBox(height: 8),
        if (_isGridView)
          Text(
            mediaItem.description ??
                'A soothing collection of beats perfect for late night coding sessions or winding down.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: kTextSecondary,
                  height: 1.4,
                ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${mediaItem.encryptedSize ~/ 1000000} MB',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: kTextSecondary,
                  ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.info, size: 20, color: Colors.white),
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
                const SizedBox(width: 8),
                if (!isExpired)
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.play_arrow, size: 16),
                        SizedBox(width: 4),
                        Text('Play', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
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
    }
  }
}
