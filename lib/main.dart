import 'package:clue_player/screens/system_monitor.dart';
import 'package:clue_player/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_kit/media_kit.dart';

import 'data/video_repository.dart';
import 'layout/sidebar_shell.dart';
import 'screens/dashboard_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/login_screen.dart';
import 'screens/player_screen.dart';
import 'screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // CRITICAL: Initialize Video Engine
  MediaKit.ensureInitialized();

  // INITIALIZE DATABASE REPOSITORY
  final repo = VideoRepository();
  await repo.initialize(); // This will seed MockData if it's the first run

  runApp(const CluePlayerApp());
}

class CluePlayerApp extends StatelessWidget {
  const CluePlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Clue Player | Moderated Safe App',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFF00AAFF), // Greyway Blue
        useMaterial3: true,
        // PRESERVED: Your Google Fonts styling
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00AAFF),
          surface: Color(0xFF1E1E1E),
        ),
      ),
    );
  }
}

// NAVIGATION ROUTER
final GoRouter _router = GoRouter(
  initialLocation: '/welcome', // Start at Landing Page
  routes: [
    // 0. LANDING
    GoRoute(path: '/welcome', builder: (c, s) => const WelcomeScreen()),

    // 1. LOGIN / AGE GATE
    GoRoute(path: '/login', builder: (c, s) => const LoginScreen()),

    // 2. SHELL (Library)
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          SidebarShell(navigationShell: navigationShell),
      branches: [
        // BRANCH 0: LIBRARY (Main Dashboard)
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/library',
            builder: (c, s) =>
                const DashboardScreen(title: "Clue Library", filterType: 'ALL'),
          ),
        ]),

        // BRANCH 1: LEARNING
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/learn',
            builder: (c, s) => const DashboardScreen(
                title: "Knowledge Base", filterType: 'LEARNING'),
          ),
        ]),

        // BRANCH 2: CHILLING
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/chill',
            builder: (c, s) => const DashboardScreen(
                title: "Relaxation Zone", filterType: 'CHILLING'),
          ),
        ]),

        // BRANCH 3: PRIVATE
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/private',
            redirect: (context, state) {
              // Auth Logic Placeholder
              return null;
            },
            builder: (c, s) => const DashboardScreen(
                title: "Secure Vault", filterType: 'PRIVATE'),
          ),
        ]),

        // BRANCH 4: FAVORITES (THE FIX: Moved inside the Shell)
        StatefulShellBranch(routes: [
          GoRoute(
              path: '/favorites', builder: (c, s) => const FavoritesScreen()),
        ]),
      ],
    ),

    // 3. FULL SCREEN PAGES (Settings, Player, etc.)
    GoRoute(path: '/settings', builder: (c, s) => const SettingsScreen()),

    // System Monitor (Added from checklist)
    GoRoute(path: '/sysmon', builder: (c, s) => const SystemMonitor()),

    GoRoute(
      path: '/player',
      builder: (context, state) {
        // PRESERVED: Your specific argument parsing logic
        final args = state.extra as Map<String, dynamic>;
        return PlayerScreen(videoUrl: args['url'], title: args['title']);
      },
    ),
  ],
);
