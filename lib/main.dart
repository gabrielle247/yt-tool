// ==========================================
// FILE: ./main.dart
// ==========================================

import 'package:clue_player/core/database/schema.dart';
import 'package:clue_player/core/encryption/secure_vault.dart';
import 'package:clue_player/core/services/data_repository.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

// Design system
const Color kGwBackground = Color(0xFF0F1116);
const Color kGwSidebarBg = Color(0xFF161922);
const Color kGwAccentBlue = Color(0xFF00AAFF);
const Color kGwCardBg = Color(0xFF1E222D);
const Color kGwTextPrimary = Color(0xFFEEEEEE);
const Color kGwTextSecondary = Color(0xFF8E94A5);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize window manager
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    size: Size(1400, 900),
    center: true,
    title: "Clue Player",
    backgroundColor: Colors.transparent,
    titleBarStyle: TitleBarStyle.hidden,
  );
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  // Initialize services
  final database = ClueDatabase();
  // ignore: unused_local_variable
  final vault = SecureVault('your-secure-key-here', enc.Key.fromUtf8('your-secure-key-here'.padRight(32, '0').substring(0, 32)), enc.IV.fromLength(16)); // You need to manage this key properly
  final repository = DataRepository(database);

  runApp(
    Provider<DataRepository>.value(
      value: repository,
      child: const CluePlayerApp(),
    ),
  );
}

class CluePlayerApp extends StatelessWidget {
  const CluePlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kGwBackground,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Inter', color: kGwTextPrimary),
        ),
      ),
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const DashboardScreen(),
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<DataRepository>(context);

    return Scaffold(
      backgroundColor: kGwBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Clue Player',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Local-First Media Vault',
              style: TextStyle(
                fontSize: 18,
                color: kGwTextSecondary,
              ),
            ),
            const SizedBox(height: 40),
            FutureBuilder<Map<String, dynamic>>(
              future: repository.getSystemStatus(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final status = snapshot.data!;
                  return Column(
                    children: [
                      Text(
                        'Vault Status: ${status['vaultStatus']}',
                        style: const TextStyle(color: kGwAccentBlue),
                      ),
                      Text(
                        'Videos: ${status['totalVideos']}',
                        style: const TextStyle(color: kGwTextSecondary),
                      ),
                    ],
                  );
                }
                return const CircularProgressIndicator(color: kGwAccentBlue);
              },
            ),
          ],
        ),
      ),
    );
  }
}