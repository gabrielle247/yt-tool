import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:window_manager/window_manager.dart';
import 'package:media_kit/media_kit.dart';

// --- CLUE PLAYER DESIGN SYSTEM (GREYWAY DARK) ---
const Color kGwBackground = Color(0xFF0F1116); 
const Color kGwSidebarBg = Color(0xFF161922);
const Color kGwAccentBlue = Color(0xFF00AAFF);
const Color kGwCardBg = Color(0xFF1E222D);
const Color kGwTextPrimary = Color(0xFFEEEEEE);
const Color kGwTextSecondary = Color(0xFF8E94A5);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  
  // Linux Desktop Window Management
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    size: Size(1280, 800),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
    title: "Clue Player",
  );
  
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const CluePlayerApp());
}

// --- ROUTING SYSTEM ---
final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  initialLocation: '/library',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainLayoutShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/library',
              builder: (context, state) => const DashboardScreen(title: "All Videos"),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/learning',
              builder: (context, state) => const DashboardScreen(title: "Learning"),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/chilling',
              builder: (context, state) => const DashboardScreen(title: "Chilling"),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/private',
              builder: (context, state) => const PrivateVaultScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const DashboardScreen(title: "Favorites"),
            ),
          ],
        ),
      ],
    ),
  ],
);

class CluePlayerApp extends StatelessWidget {
  const CluePlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Clue Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kGwBackground,
        fontFamily: 'Inter', 
      ),
      routerConfig: _router,
    );
  }
}

// --- MAIN LAYOUT ---
class MainLayoutShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainLayoutShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // SIDEBAR
          Container(
            width: 260,
            color: kGwSidebarBg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      Icon(Icons.play_circle_fill, color: kGwAccentBlue, size: 32),
                      SizedBox(width: 12),
                      Text("Clue Player", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                _buildSidebarSection("LIBRARY", [
                  _SidebarItem(icon: Icons.home, label: "All Videos", index: 0),
                  _SidebarItem(icon: Icons.school, label: "Learning", index: 1),
                  _SidebarItem(icon: Icons.airplanemode_active, label: "Chilling", index: 2),
                  _SidebarItem(icon: Icons.lock, label: "Private", index: 3),
                ]),
                const Divider(color: Colors.white10, height: 40),
                _buildSidebarSection("MY COLLECTIONS", [
                  _SidebarItem(icon: Icons.favorite, label: "Favorites", index: 4),
                  _SidebarItem(icon: Icons.history, label: "Watch Later", index: 0), 
                  _SidebarItem(icon: Icons.download_for_offline, label: "Downloads", index: 0),
                ]),
                const Spacer(),
                // SECURE LOCAL VAULT CARD
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: kGwAccentBlue.withAlpha(20),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: kGwAccentBlue.withAlpha(40)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.security, color: kGwAccentBlue),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Secure Local Vault", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            Text("Private Vault: On-Device", style: TextStyle(fontSize: 10, color: kGwTextSecondary)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // MAIN CONTENT
          Expanded(
            child: Column(
              children: [
                const _Header(),
                Expanded(child: navigationShell),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(title, style: const TextStyle(color: kGwTextSecondary, fontSize: 11, letterSpacing: 1.2)),
        ),
        ...items,
      ],
    );
  }

  Widget _SidebarItem({required IconData icon, required String label, required int index}) {
    bool isActive = navigationShell.currentIndex == index;
    return InkWell(
      onTap: () => navigationShell.goBranch(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? kGwAccentBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: isActive ? Colors.white : kGwTextSecondary),
            const SizedBox(width: 12),
            Text(label, style: TextStyle(color: isActive ? Colors.white : kGwTextSecondary, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}

// --- HEADER ---
class _Header extends StatelessWidget {
  const _Header();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: kGwSidebarBg,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: kGwTextSecondary),
                  hintText: "Search videos...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 40),
          const Text("Learning", style: TextStyle(color: kGwTextSecondary)),
          const SizedBox(width: 20),
          const Text("Chilling", style: TextStyle(color: kGwTextSecondary)),
          const SizedBox(width: 20),
          const Text("Private", style: TextStyle(color: kGwTextSecondary)),
          const SizedBox(width: 20),
          const Icon(Icons.notifications_none, color: kGwTextSecondary),
          const SizedBox(width: 20),
          const CircleAvatar(radius: 16, backgroundColor: kGwAccentBlue),
        ],
      ),
    );
  }
}

// --- DASHBOARD ---
class DashboardScreen extends StatelessWidget {
  final String title;
  const DashboardScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const Text("Focus & Unwind", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text("A curated sanctuary of videos for deep learning or pure relaxation. Safe, secure, and ready for you.", 
          style: TextStyle(color: kGwTextSecondary)),
        const SizedBox(height: 32),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Recommended for You", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                _FilterChip(label: "All", isActive: true),
                _FilterChip(label: "Most Popular"),
                _FilterChip(label: "Newest"),
                _FilterChip(label: "Short (<10m)"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.78,
          ),
          itemCount: 8,
          itemBuilder: (context, index) => const _VideoCard(),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isActive;
  const _FilterChip({required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? kGwAccentBlue : kGwCardBg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: TextStyle(fontSize: 12, color: isActive ? Colors.white : kGwTextSecondary)),
    );
  }
}

class _VideoCard extends StatelessWidget {
  const _VideoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kGwCardBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Stack(
                children: [
                  const Center(child: Icon(Icons.image, color: Colors.white24)),
                  Positioned(
                    top: 8, left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.purple.withAlpha(200), borderRadius: BorderRadius.circular(4)),
                      child: const Text("CHILLING", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Positioned(
                    bottom: 8, right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: Colors.black.withAlpha(180), borderRadius: BorderRadius.circular(4)),
                      child: const Text("24:00", style: TextStyle(fontSize: 10)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Midnight Lo-Fi Radio", style: TextStyle(fontWeight: FontWeight.bold), maxLines: 1),
                const SizedBox(height: 4),
                const Text("A soothing collection of beats perfect for late night sessions...", 
                  style: TextStyle(color: kGwTextSecondary, fontSize: 11), maxLines: 2),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("128 MB", style: TextStyle(fontSize: 10, color: kGwTextSecondary)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kGwAccentBlue,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(80, 32),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      ),
                      onPressed: () {},
                      child: const Text("Download", style: TextStyle(fontSize: 11)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PrivateVaultScreen extends StatelessWidget {
  const PrivateVaultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Private Vault Placeholder"));
  }
}