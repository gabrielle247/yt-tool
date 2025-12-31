import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clue_player/core/database/schema.dart';
import 'package:clue_player/core/services/data_repository.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize database
  final database = ClueDatabase();
  final repository = DataRepository(database);
  
  runApp(
    Provider<DataRepository>.value(
      value: repository,
      child: const CluePlayerApp(),
    ),
  );
}