import 'package:clue_player/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background decorative elements
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [kSurfaceDark, kBackgroundDark],
                ),
              ),
            ),
          ),
          Positioned(
            top: -160,
            right: -160,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                color: kPrimary.withAlpha(25),
                borderRadius: BorderRadius.circular(200),
                boxShadow: [
                  BoxShadow(
                    color: kPrimary.withAlpha(51),
                    spreadRadius: 50,
                    blurRadius: 100,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -160,
            left: -160,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.blue.withAlpha(13),
                borderRadius: BorderRadius.circular(150),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withAlpha(26),
                    spreadRadius: 30,
                    blurRadius: 60,
                  ),
                ],
              ),
            ),
          ),
          
          // Content - wrapped in SingleChildScrollView to fix overflow issue
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LogoBadge(),
                    const SizedBox(height: 48),
                    const HeroSection(),
                    const SizedBox(height: 48),
                    const FeaturesGrid(),
                    const SizedBox(height: 48),
                    StartButtons(context: context),
                    const SizedBox(height: 64), // Added extra space at bottom for the status bar
                  ],
                ),
              ),
            ),
          ),
          
          // Bottom status bar
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: kSurfaceCard,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.lock, size: 16, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(
                        'Your data stays on your device. No cloud tracking.',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: kTextSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LogoBadge extends StatelessWidget {
  const LogoBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: kPrimary.withAlpha(25),
        border: Border.all(color: kPrimary.withAlpha(51)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.play_circle, color: kPrimary, size: 20),
          const SizedBox(width: 8),
          Text(
            'Local-First & Secure',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: kPrimary,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your Personal',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Secure Media Vault',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            background: Paint()
              ..shader = const LinearGradient(
                colors: [kPrimary, Colors.blueAccent],
              ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Experience curated learning and chilling content with complete peace of mind. Your watch history, preferences, and private videos never leave your device.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: kTextSecondary,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class FeaturesGrid extends StatelessWidget {
  const FeaturesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: const [
        FeatureCard(
          icon: Icons.shield_outlined,
          title: 'Local Privacy',
          description: 'No backend servers. Your data is encrypted and stored locally on your machine.',
          color: Colors.blue,
        ),
        FeatureCard(
          icon: Icons.subscriptions,
          title: 'Curated Content',
          description: 'Hand-picked videos for focused learning and relaxation. No algorithmic noise.',
          color: Colors.purple,
        ),
        FeatureCard(
          icon: Icons.admin_panel_settings,
          title: 'Age-Gated Safety',
          description: 'Secure private mode for sensitive content with robust age verification.',
          color: Colors.red,
        ),
        FeatureCard(
          icon: Icons.offline_bolt,
          title: 'Offline Ready',
          description: 'Download your favorites to your secure vault and watch anywhere, anytime.',
          color: Colors.teal,
        ),
      ],
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kSurfaceCard.withAlpha(204),
        border: Border.all(color: kSurfaceCard.withAlpha(204)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withAlpha(25),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: kTextSecondary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StartButtons extends StatelessWidget {
  final BuildContext context;
  
  const StartButtons({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => context.go('/'),
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            shadowColor: Colors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Get Started',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward, color: Colors.white),
            ],
          ),
        ),
        const SizedBox(width: 16),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            backgroundColor: kSurfaceCard,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            side: const BorderSide(color: kSurfaceCard),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Text(
            'Learn More',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}