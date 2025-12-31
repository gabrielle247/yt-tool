// ==========================================
// FILE: lib/screens/welcome_screen.dart
// ==========================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Row(
        children: [
          // LEFT CONTENT AREA
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(64.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00AAFF).withAlpha(30),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF00AAFF).withAlpha(100)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.shield, size: 14, color: Color(0xFF00AAFF)),
                        SizedBox(width: 8),
                        Text("LOCAL-FIRST & SECURE", style: TextStyle(color: Color(0xFF00AAFF), fontSize: 10, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Your Personal\nSecure Media\nVault",
                    style: GoogleFonts.inter(
                      fontSize: 56,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Secure Media",
                    style: GoogleFonts.inter(
                      fontSize: 56,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                      color: const Color(0xFF00AAFF), 
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Experience curated learning and chilling content with complete peace of mind. Your watch history, preferences, and private videos never leave your device.",
                    style: TextStyle(color: Colors.grey[400], fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      FilledButton.icon(
                        onPressed: () => context.go('/library'),
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text("Get Started"),
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFF00AAFF),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                        ),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                        ),
                        child: const Text("Learn More", style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white.withAlpha(20)),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.lock, color: Colors.green, size: 16),
                        SizedBox(width: 12),
                        Text("Your data stays on your device. No cloud tracking.", style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          
          // RIGHT FEATURE GRID
          Expanded(
            flex: 4,
            child: Container(
              color: const Color(0xFF161616),
              padding: const EdgeInsets.all(48),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: 0.8,
                children: [
                  _buildFeatureCard(Icons.security, "Local Privacy", "No backend servers. Data encrypted locally."),
                  _buildFeatureCard(Icons.video_library, "Curated Content", "Hand-picked videos for focus and relaxation."),
                  _buildFeatureCard(Icons.verified_user, "Age-Gated Safety", "Secure private mode for sensitive content."),
                  _buildFeatureCard(Icons.offline_bolt, "Offline Ready", "Download your favorites and watch anywhere."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String desc) {
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
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFF252525), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: const Color(0xFF00AAFF)),
          ),
          const Spacer(),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Text(desc, style: TextStyle(color: Colors.grey[500], fontSize: 12, height: 1.4)),
        ],
      ),
    );
  }
}