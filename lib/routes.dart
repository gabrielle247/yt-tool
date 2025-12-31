import 'package:go_router/go_router.dart';
import 'features/home/home_screen.dart';
import 'features/player/video_player_screen.dart';
import 'features/vault/vault_screen.dart';
import 'features/vault/age_verification_screen.dart';
import 'features/content/content_list_screen.dart';
import 'features/settings/settings_screen.dart';
import 'features/onboarding/welcome_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/welcome',
  routes: [
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'player/:videoId',
          builder: (context, state) => VideoPlayerScreen(
            videoId: state.pathParameters['videoId']!,
          ),
        ),
        GoRoute(
          path: 'vault',
          builder: (context, state) => const VaultScreen(),
        ),
        GoRoute(
          path: 'verify-age',
          builder: (context, state) => const AgeVerificationScreen(),
        ),
        GoRoute(
          path: 'content/:category',
          builder: (context, state) => ContentListScreen(
            category: state.pathParameters['category']!,
          ),
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);