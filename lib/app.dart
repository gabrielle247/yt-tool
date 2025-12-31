import 'package:flutter/material.dart';
import 'routes.dart';
import 'theme.dart';

class CluePlayerApp extends StatelessWidget {
  const CluePlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Clue Player',
      theme: cluePlayerTheme,
      routerConfig: appRouter,
    );
  }
}