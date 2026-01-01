import 'package:clue_player/core/providers/media_providers.dart';
import 'package:clue_player/core/theme/app_theme.dart';
import 'package:clue_player/features/content/content_list_screen.dart';
import 'package:clue_player/features/vault/vault_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';

/// Navigation State Notifier to keep UI logic robust and testable.
class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(0);

  void setIndex(int index) => state = index;
}

/// Global provider for navigation state.
final navigationProvider = StateNotifierProvider<NavigationNotifier, int>((ref) {
  return NavigationNotifier();
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationProvider);

    return Scaffold(
      body: Row(
        children: [
          const AppSidebar(),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _buildContentSection(currentIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection(int index) {
    switch (index) {
      case 0:
        return const ContentListScreen(key: ValueKey('all'), category: 'all');
      case 1:
        return const ContentListScreen(key: ValueKey('learning'), category: 'learning');
      case 2:
        return const ContentListScreen(key: ValueKey('chilling'), category: 'chilling');
      case 3:
        return const VaultScreen(key: ValueKey('vault'));
      default:
        return const ContentListScreen(key: ValueKey('default'), category: 'all');
    }
  }
}

class AppSidebar extends ConsumerWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(
          right: BorderSide(color: AppColors.primary.withAlpha(26), width: 1),
        ),
      ),
      child: const Column(
        children: [
          AppHeader(),
          SizedBox(height: 24),
          NavigationMenu(),
          Spacer(),
          StorageInfoCard(),
        ],
      ),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          const Icon(Icons.play_circle_filled, color: AppColors.primary, size: 36),
          const SizedBox(width: 14),
          Text(
            'Batch Tech',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
          ),
        ],
      ),
    );
  }
}

class NavigationMenu extends ConsumerWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeIndex = ref.watch(navigationProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Library'),
          _NavItem(
            title: 'All Videos', 
            icon: Icons.grid_view_rounded, 
            index: 0, 
            isActive: activeIndex == 0,
          ),
          _NavItem(
            title: 'Learning', 
            icon: Icons.auto_stories_rounded, 
            index: 1, 
            isActive: activeIndex == 1,
          ),
          _NavItem(
            title: 'Chilling', 
            icon: Icons.nightlight_round, 
            index: 2, 
            isActive: activeIndex == 2,
          ),
          _NavItem(
            title: 'Private Vault', 
            icon: Icons.lock_outline_rounded, 
            index: 3, 
            isActive: activeIndex == 3,
          ),
          const SizedBox(height: 32),
          _buildSectionTitle('System'),
          _NavItem(
            title: 'Settings', 
            icon: Icons.settings_suggest_rounded, 
            index: 4, 
            onTap: () => context.push('/settings'),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 12),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: AppColors.onSurfaceVariant,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}

class _NavItem extends ConsumerWidget {
  final String title;
  final IconData icon;
  final int index;
  final bool isActive;
  final VoidCallback? onTap;

  const _NavItem({
    required this.title,
    required this.icon,
    required this.index,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = isActive ? AppColors.primary : AppColors.onSurfaceVariant;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          onTap: onTap ?? () => ref.read(navigationProvider.notifier).setIndex(index),
          leading: Icon(icon, color: color, size: 22),
          title: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : AppColors.onSurfaceVariant,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              fontSize: 14,
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          selected: isActive,
          selectedTileColor: AppColors.primary.withAlpha(38),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}

class StorageInfoCard extends ConsumerWidget {
  const StorageInfoCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repository = ref.watch(dataRepositoryProvider);

    return FutureBuilder<Map<String, dynamic>>(
      future: repository.getSystemStatus(),
      builder: (context, snapshot) {
        final isLoading = snapshot.connectionState == ConnectionState.waiting;
        final status = snapshot.data;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surfaceVariant.withAlpha(128),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primary.withAlpha(26)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.security_rounded, color: AppColors.primary.withAlpha(200), size: 18),
                    const SizedBox(width: 8),
                    const Text(
                      'Security Status',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: isLoading ? null : 1.0,
                    backgroundColor: AppColors.primary.withAlpha(26),
                    color: AppColors.primary,
                    minHeight: 4,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${status?['totalVideos'] ?? 0} Items',
                      style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 11),
                    ),
                    Text(
                      status?['vaultStatus'] ?? 'Verifying...',
                      style: TextStyle(
                        color: status?['vaultStatus'] == 'Active' ? Colors.greenAccent : AppColors.primary,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}