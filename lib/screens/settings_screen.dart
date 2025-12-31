// ==========================================
// FILE: lib/screens/settings_screen.dart
// ==========================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0,
        leading: const BackButton(),
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          Text("Settings & Support", style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 8),
          Text("Manage your app preferences and get help.", style: TextStyle(color: Colors.grey[500], fontSize: 16)),
          const SizedBox(height: 40),

          // PREFERENCES CARD
          _buildSettingsCard(
            title: "App Preferences",
            icon: Icons.tune,
            children: [
              _buildRow("Playback Quality", "Auto (Recommended)", true),
              const SizedBox(height: 24),
              _buildRow("Vault Location", "/Users/CluePlayer/LocalVault", false, isPath: true),
            ],
          ),
          const SizedBox(height: 24),

          // PRIVACY CARD
          _buildSettingsCard(
            title: "Privacy & Local Storage Policy",
            icon: Icons.shield,
            children: [
              const Text(
                "Clue Player is built on a Local-First Architecture. We are committed to ensuring your digital footprint remains exclusively yours.",
                style: TextStyle(color: Colors.grey, height: 1.5),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: _buildInfoTile(Icons.cloud_off, "Zero Cloud Tracking", "Your viewing history never leaves.")),
                  const SizedBox(width: 16),
                  Expanded(child: _buildInfoTile(Icons.enhanced_encryption, "Client-Side Encryption", "All content is encrypted at rest.")),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard({required String title, required IconData icon, required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withAlpha(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF00AAFF), size: 20),
              const SizedBox(width: 12),
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(color: Color(0xFF333333), height: 32),
          ...children,
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, bool isDropdown, {bool isPath = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text("Description for $label", style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF121212),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF333333)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value, style: const TextStyle(color: Colors.white)),
                if (isDropdown) const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                if (isPath) 
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                     decoration: BoxDecoration(color: const Color(0xFF333333), borderRadius: BorderRadius.circular(4)),
                     child: const Text("Change", style: TextStyle(fontSize: 12, color: Colors.white)),
                   )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF121212),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 4),
                Text(desc, style: TextStyle(color: Colors.grey[600], fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}