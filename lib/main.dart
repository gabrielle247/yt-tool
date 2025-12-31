import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:media_kit/media_kit.dart';
import 'layout/sidebar_shell.dart';
import 'screens/dashboard_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
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
  initialLocation: '/library',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return SidebarShell(navigationShell: navigationShell);
      },
      branches: [
        // 1. LIBRARY (Main Dashboard)
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/library',
            builder: (c, s) => const DashboardScreen(title: "Clue Library", filterType: 'ALL'),
          ),
        ]),
        // 2. LEARNING
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/learn',
            builder: (c, s) => const DashboardScreen(title: "Knowledge Base", filterType: 'LEARNING'),
          ),
        ]),
        // 3. CHILLING
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/chill',
            builder: (c, s) => const DashboardScreen(title: "Relaxation Zone", filterType: 'CHILLING'),
          ),
        ]),
        // 4. PRIVATE (Gatekeeper)
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/private',
            builder: (c, s) => const DashboardScreen(title: "Secure Vault", filterType: 'PRIVATE'),
          ),
        ]),
      ],
    ),
  ],
);