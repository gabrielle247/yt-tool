import 'package:clue_player/features/content/content_list_screen.dart';
import 'package:clue_player/features/vault/vault_screen.dart';
import 'package:clue_player/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clue_player/core/services/data_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Row(
        children: [
          const AppSidebar(),
          Expanded(
            child: _buildContentSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildContentSection() {
    switch (_currentIndex) {
      case 0:
        return const ContentListScreen(category: 'all');
      case 1:
        return const ContentListScreen(category: 'learning');
      case 2:
        return const ContentListScreen(category: 'chilling');
      case 3:
        return const VaultScreen();
      default:
        return const ContentListScreen(category: 'all');
    }
  }

  // Public method to update the current index so callers don't invoke setState directly.
  void updateIndex(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }
}

class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: kBackgroundDark,
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
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          const Icon(Icons.play_circle, color: kPrimary, size: 32),
          const SizedBox(width: 12),
          Text(
            'Clue Player',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_HomeScreenState>();
    
    return Column(
      children: [
        _buildSectionTitle('Library', context),
        _buildNavItem('All Videos', Icons.home, 0, context, state),
        _buildNavItem('Learning', Icons.school, 1, context, state),
        _buildNavItem('Chilling', Icons.self_improvement, 2, context, state),
        _buildNavItem('Private', Icons.lock, 3, context, state),
        
        const SizedBox(height: 24),
        
        _buildSectionTitle('My Collections', context),
        _buildNavItem('Favorites', Icons.favorite, -1, context, state, color: Colors.red),
        _buildNavItem('Watch Later', Icons.history, -1, context, state, color: Colors.blue),
        _buildNavItem('Downloads', Icons.download, -1, context, state, color: Colors.green),
        
        const SizedBox(height: 24),
        
        _buildSectionTitle('System', context),
        _buildNavItem('Settings & Support', Icons.settings, 4, context, state),
      ],
    );
  }
  
  Widget _buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, bottom: 12, top: 12),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: kTextSecondary,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
  
  Widget _buildNavItem(String title, IconData icon, int index, BuildContext context, _HomeScreenState? state, {Color? color}) {
    final isSelected = state != null && state._currentIndex == index;
    
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? kPrimary : (color ?? kTextSecondary),
        size: 24,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: isSelected ? Colors.white : kTextSecondary,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: index >= 0 && state != null ? () {
        state.updateIndex(index);
      } : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      tileColor: isSelected ? kSurfaceCard : Colors.transparent,
      hoverColor: kSurfaceCard,
    );
  }
}

class StorageInfoCard extends StatelessWidget {
  const StorageInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DataRepository>(
      builder: (context, repository, _) {
        return FutureBuilder<Map<String, dynamic>>(
          future: repository.getSystemStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const _StorageInfoLoading();
            }
            
            final status = snapshot.data ?? {
              'vaultStatus': 'Active',
              'totalVideos': 0,
            };
            
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [kPrimary.withAlpha(51), kPrimary.withAlpha(13)],
                  ),
                  border: Border.all(color: kPrimary.withAlpha(51)),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: kPrimary.withAlpha(77),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.shield_outlined, color: kPrimary, size: 20),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Secure Local Vault',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: kPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Private Vault: On-Device Storage',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: kTextSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${status['totalVideos']} videos • ',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '${status['vaultStatus']}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _StorageInfoLoading extends StatelessWidget {
  const _StorageInfoLoading();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: kSurfaceCard,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: CircularProgressIndicator(color: kPrimary),
        ),
      ),
    );
  }
}