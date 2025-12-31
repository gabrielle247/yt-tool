import 'package:clue_player/theme.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundDark,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          _buildHeader(),
          _buildAppPreferences(),
          _buildPrivacyPolicy(),
          _buildSupportSection(),
          _buildVersionInfo(),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'Settings & Support',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications, color: Colors.white),
        ),
        const SizedBox(width: 16),
        const CircleAvatar(
          radius: 16,
          backgroundColor: kSurfaceCard,
          backgroundImage: NetworkImage(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBhBef68BeoaUsi7pyx6GwaPvZSyWQJcI4fx5RLpkxWDeRg4yIwOs9QCU7tjXRPQ3wQV_odM_qHmIkb72ELjLOZNjdPKdLczl1Ow3ivsmVTFASYf1AUa7lHh7vdxLGqpGeW7SZIIriLJpGlY6PG_yg9XiQ2oG_8rbFc8Z3RvUtL14INGV3n10dnqpEVGZF2ahSj8dSkK2fTfY_EZXOkqkHgIuDfQe-w3jKbi7wkHNtEtUrFni5Sg6c_f3bE97aM3ZkmSqDM_EE9_g',
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildHeader() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: kSurfaceDark,
          border: Border(bottom: BorderSide(color: kSurfaceCard)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings & Support',
              style: Theme.of(context as BuildContext)
                  .textTheme
                  .displayMedium
                  ?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Manage your app preferences and get help.',
              style: Theme.of(context as BuildContext)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(
                    color: kTextSecondary,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppPreferences() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: kSurfaceCard,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: kSurfaceCard.withAlpha(128)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: kPrimary.withAlpha(51),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.tune, color: kPrimary, size: 24),
                ),
                const SizedBox(width: 12),
                Text(
                  'App Preferences',
                  style: Theme.of(context as BuildContext)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSettingRow(
              context as BuildContext,
              'Playback Quality',
              'Choose your default streaming resolution. Higher quality uses more data.',
              child: DropdownButton<String>(
                value: 'Auto (Recommended)',
                items: const [
                  DropdownMenuItem(
                      value: 'Auto (Recommended)',
                      child: Text('Auto (Recommended)')),
                  DropdownMenuItem(
                      value: 'High Definition (1080p)',
                      child: Text('High Definition (1080p)')),
                  DropdownMenuItem(
                      value: 'Standard (720p)', child: Text('Standard (720p)')),
                  DropdownMenuItem(
                      value: 'Data Saver (480p)',
                      child: Text('Data Saver (480p)')),
                ],
                onChanged: (value) {},
                underline: Container(),
                style: Theme.of(context as BuildContext)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                      color: Colors.white,
                    ),
                dropdownColor: kSurfaceDark,
                iconEnabledColor: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            _buildSettingRow(
              context as BuildContext,
              'Vault Location',
              'Local path where your private content is encrypted and stored.',
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      decoration: BoxDecoration(
                        color: kSurfaceDark,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: kSurfaceCard),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.folder,
                              color: kTextSecondary, size: 20),
                          const SizedBox(width: 10),
                          Text(
                            '/Users/CluePlayer/LocalVault',
                            style: Theme.of(context as BuildContext)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: kTextSecondary,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kSurfaceDark,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Change Path'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(38),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.withAlpha(77)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.verified_user,
                      color: Colors.green, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    'Local write permission active',
                    style: Theme.of(context as BuildContext)
                        .textTheme
                        .bodySmall
                        ?.copyWith(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyPolicy() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: kSurfaceCard,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: kPrimary.withAlpha(77)),
          gradient: const LinearGradient(
            colors: [kSurfaceCard, kSurfaceDark],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: kPrimary.withAlpha(51),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.security, color: kPrimary, size: 24),
                ),
                const SizedBox(width: 12),
                Text(
                  'Privacy & Local Storage Policy',
                  style: Theme.of(context as BuildContext)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Clue Player is built on a Local-First Architecture. We are committed to ensuring your digital footprint remains exclusively yours. Unlike traditional streaming platforms, we do not centralize your data.',
              style: Theme.of(context as BuildContext)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(
                    color: kTextSecondary,
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: kSurfaceDark,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: kSurfaceCard),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[900],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.cloud_off,
                                  color: Colors.blue, size: 24),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Zero Cloud Tracking',
                              style: Theme.of(context as BuildContext)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Your viewing history and behavioral data are never uploaded to our servers.',
                          style: Theme.of(context as BuildContext)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: kTextSecondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: kSurfaceDark,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: kSurfaceCard),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[900],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.lock_outline,
                                  color: Colors.purple, size: 24),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Client-Side Encryption',
                              style: Theme.of(context as BuildContext)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'All downloaded content is encrypted at rest on your device\'s hard drive.',
                          style: Theme.of(context as BuildContext)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: kTextSecondary,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kPrimary.withAlpha(26),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: kPrimary.withAlpha(77)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info, color: kPrimary, size: 24),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'You have full ownership of your local vault data.',
                      style: Theme.of(context as BuildContext)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Read Full Policy',
                      style: Theme.of(context as BuildContext)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                            color: kPrimary,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportSection() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(24),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: kSurfaceCard,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: kSurfaceCard.withAlpha(128)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: kPrimary.withAlpha(51),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child:
                              const Icon(Icons.mail, color: kPrimary, size: 24),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Contact Support',
                          style: Theme.of(context as BuildContext)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextField('Name', 'Your name'),
                        const SizedBox(height: 16),
                        _buildTextField('Email', 'your@email.com'),
                        const SizedBox(height: 16),
                        _buildDropdownField('Subject', [
                          'Technical Issue',
                          'Feature Request',
                          'Billing Inquiry',
                          'Other',
                        ]),
                        const SizedBox(height: 16),
                        _buildTextArea('Message', 'How can we help you today?'),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            'Send Message',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: kSurfaceCard,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: kSurfaceCard.withAlpha(128)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Direct Channels',
                          style: Theme.of(context as BuildContext)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                color: kTextSecondary,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                        ),
                        const SizedBox(height: 16),
                        _buildContactCard(
                          Icons.code,
                          'Lead Developer',
                          'dev@clueplayer.app',
                        ),
                        const SizedBox(height: 16),
                        _buildContactCard(
                          Icons.support_agent,
                          'Customer Success',
                          'help@clueplayer.app',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        colors: [Colors.blue[900]!, Colors.blue[800]!],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.chat_bubble,
                            color: Colors.white, size: 48),
                        const SizedBox(height: 16),
                        Text(
                          'Join the Community',
                          style: Theme.of(context as BuildContext)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Connect with other Clue Player users, share setups, and get instant help on our Discord server.',
                          style: Theme.of(context as BuildContext)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                color: Colors.white70,
                                height: 1.5,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            'Join Discord',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVersionInfo() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Text(
          'Clue Player v2.4.0 • Built for Privacy',
          textAlign: TextAlign.center,
          style:
              Theme.of(context as BuildContext).textTheme.bodySmall?.copyWith(
                    color: kTextSecondary,
                  ),
        ),
      ),
    );
  }

  Widget _buildSettingRow(
      BuildContext context, String title, String description,
      {required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: kTextSecondary,
              ),
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              Theme.of(context as BuildContext).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: kSurfaceDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kSurfaceCard),
          ),
          child: TextField(
            style: Theme.of(context as BuildContext)
                .textTheme
                .bodyMedium
                ?.copyWith(
                  color: Colors.white,
                ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context as BuildContext)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(
                    color: kTextSecondary.withAlpha(128 ),
                  ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              Theme.of(context as BuildContext).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: kSurfaceDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kSurfaceCard),
          ),
          child: DropdownButton<String>(
            value: options.first,
            items: options.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: Theme.of(context as BuildContext)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                        color: Colors.white,
                      ),
                ),
              );
            }).toList(),
            onChanged: (value) {},
            underline: Container(),
            style: Theme.of(context as BuildContext)
                .textTheme
                .bodyMedium
                ?.copyWith(
                  color: Colors.white,
                ),
            dropdownColor: kSurfaceDark,
            iconEnabledColor: Colors.white,
            isExpanded: true,
          ),
        ),
      ],
    );
  }

  Widget _buildTextArea(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              Theme.of(context as BuildContext).textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: kSurfaceDark,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: kSurfaceCard),
          ),
          child: TextField(
            maxLines: 5,
            style: Theme.of(context as BuildContext)
                .textTheme
                .bodyMedium
                ?.copyWith(
                  color: Colors.white,
                ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context as BuildContext)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(
                    color: kTextSecondary.withAlpha(128),
                  ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactCard(IconData icon, String title, String email) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      hoverColor: kSurfaceDark,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kSurfaceDark,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kSurfaceCard),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kSurfaceCard,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context as BuildContext)
                      .textTheme
                      .bodySmall
                      ?.copyWith(
                        color: kTextSecondary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: Theme.of(context as BuildContext)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
