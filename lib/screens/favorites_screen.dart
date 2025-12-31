// ==========================================
// FILE: lib/screens/favorites_screen.dart
// ==========================================

import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/batch_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // In a real app, you'd fetch this from the database
  List<Map<String, dynamic>> get _favorites => 
      MockData.videos.where((v) => v['isFavorite'] == true).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(32),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("My Collection", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text("${_favorites.length} Saved Items", style: TextStyle(color: Colors.grey[500])),
                ],
              ),
            ),
          ),
          
          if (_favorites.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite_border, size: 64, color: Colors.grey[800]),
                    const SizedBox(height: 16),
                    const Text("No favorites yet.", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 350,
                  mainAxisExtent: 380,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final vid = _favorites[index];
                    return BatchVideoCard(
                      id: vid['id'],
                      title: vid['title'],
                      description: vid['desc'],
                      duration: vid['duration'],
                      fileSize: vid['size'],
                      thumbnailUrl: vid['thumbnailUrl'],
                      category: vid['category'],
                      status: vid['status'],
                      isFavorite: true,
                      onAction: () {}, // Handle action
                      onFavoriteToggle: () {
                        setState(() {
                          vid['isFavorite'] = false; // Remove from favorites
                        });
                      },
                    );
                  },
                  childCount: _favorites.length,
                ),
              ),
            ),
        ],
      ),
    );
  }
}