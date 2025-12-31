import 'package:clue_player/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AgeVerificationScreen extends StatefulWidget {
  const AgeVerificationScreen({super.key});

  @override
  State<AgeVerificationScreen> createState() => _AgeVerificationScreenState();
}

class _AgeVerificationScreenState extends State<AgeVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dobController = TextEditingController();
  bool _isVerified = false;
  bool _isLoading = false;
  bool _hasError = false;

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }

  void _verifyAge() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _hasError = false;
      });
      
      // Simulate verification process
      await Future.delayed(const Duration(seconds: 1));
      
      // Simple age verification logic (in real app this would be more robust)
      final today = DateTime.now();
      final inputDate = DateTime.tryParse(_dobController.text);
      
      if (inputDate != null) {
        final age = today.year - inputDate.year;
        if (age >= 18) {
          setState(() => _isVerified = true);
          // In a real app, we'd save verification status to secure storage
          Future.delayed(const Duration(seconds: 1), () {
            context.go('/vault');
          });
        } else {
          setState(() {
            _hasError = true;
            _isLoading = false;
          });
        }
      } else {
        setState(() {
          _hasError = true;
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundDark,
      body: Stack(
        children: [
          // Background gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [kBackgroundDark, kSurfaceDark],
                ),
              ),
            ),
          ),
          
          // Decorative background elements
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: kPrimary.withAlpha(26),
                borderRadius: BorderRadius.circular(150),
                boxShadow: [
                  BoxShadow(
                    color: kPrimary.withAlpha(51),
                    blurRadius: 80,
                    spreadRadius: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.blue.withAlpha(13),
                borderRadius: BorderRadius.circular(125),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withAlpha(26),
                    blurRadius: 60,
                    spreadRadius: 15,
                  ),
                ],
              ),
            ),
          ),
          
          // Main content
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 40),
                    _buildVerificationForm(),
                    if (_hasError) ...[
                      const SizedBox(height: 20),
                      _buildErrorMessage(),
                    ],
                    const SizedBox(height: 30),
                    _buildDisclaimer(),
                  ],
                ),
              ),
            ),
          ),
          
          // Preview content section (blurred)
          _buildPreviewSection(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: kPrimary.withAlpha(26),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: kPrimary.withAlpha(51)),
          ),
          child: const Icon(Icons.lock, color: kPrimary, size: 40),
        ),
        const SizedBox(height: 24),
        Text(
          'Restricted Access Area',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'This section contains private video content. Please verify your age to proceed to the secure download area.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: kTextSecondary,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildVerificationForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Date of Birth field
          TextFormField(
            controller: _dobController,
            decoration: InputDecoration(
              labelText: 'Date of Birth',
              hintText: 'YYYY-MM-DD',
              prefixIcon: const Icon(Icons.calendar_today, color: kTextSecondary),
              filled: true,
              fillColor: kSurfaceCard,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: kSurfaceCard),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: kPrimary),
              ),
              labelStyle: const TextStyle(color: kTextSecondary),
            ),
            keyboardType: TextInputType.datetime,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your date of birth';
              }
              
              try {
                final date = DateTime.parse(value);
                final today = DateTime.now();
                final age = today.year - date.year;
                if (age < 18) {
                  return 'You must be at least 18 years old to access this content';
                }
                return null;
              } catch (e) {
                return 'Please enter a valid date (YYYY-MM-DD)';
              }
            },
          ),
          const SizedBox(height: 24),
          
          // Terms agreement
          Row(
            children: [
              Checkbox(
                value: _isVerified,
                onChanged: (value) {
                  setState(() {
                    _isVerified = value ?? false;
                  });
                },
                activeColor: kPrimary,
                checkColor: Colors.white,
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: kTextSecondary,
                    ),
                    children: [
                      const TextSpan(text: 'I confirm I am over 18 years of age and agree to the '),
                      TextSpan(
                        text: 'Terms of Service',
                        style: const TextStyle(
                          color: kPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          // Handle terms of service tap
                        },
                      ),
                      const TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Verify button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _verifyAge,
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.login, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Enter Restricted Area', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorMessage() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withAlpha(26),
        border: Border.all(color: Colors.red.withAlpha(77)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.error, color: Colors.red),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Age verification failed. You must be at least 18 years old to access restricted content.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kSurfaceCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kSurfaceCard),
      ),
      child: Text(
        'By entering, you acknowledge that this platform is not responsible for the nature of user-uploaded content or how it is utilized post-download. Viewer discretion is advised.',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: kTextSecondary,
          height: 1.4,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildPreviewSection() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(24),
        color: kSurfaceDark.withAlpha(230),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest Uploads',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSurfaceCard,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const Text('All', style: TextStyle(fontSize: 12)),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSurfaceCard,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const Text('Most Popular', style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
              children: List.generate(4, (index) {
                return _buildPreviewCard(index);
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewCard(int index) {
    return Container(
      decoration: BoxDecoration(
        color: kSurfaceCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kSurfaceCard),
      ),
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: const Center(
              child: Icon(Icons.lock, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 12,
                  decoration: BoxDecoration(
                    color: kTextSecondary.withAlpha(77),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 10,
                      decoration: BoxDecoration(
                        color: kTextSecondary.withAlpha(77),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: kTextSecondary.withAlpha(77),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}