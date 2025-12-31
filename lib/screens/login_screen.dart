// ==========================================
// FILE: lib/screens/login_screen.dart
// ==========================================

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;

  void _handleVerify() {
    if (_isChecked) {
      // In a real app, save this verification to SecureStorage
      context.go('/private'); // Route to private vault
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please confirm your age.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117), // Deep Dark Blue
      body: Center(
        child: Container(
          width: 450,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: const Color(0xFF161B22),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFF30363D)),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(150), blurRadius: 20, offset: const Offset(0, 10)),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFF0D1826),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.lock, color: Color(0xFF00AAFF), size: 32),
              ),
              const SizedBox(height: 24),
              Text(
                "Private Vault Access",
                style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 12),
              Text(
                "This section contains user-uploaded content that may be sensitive or restricted. Verification is required for your safety.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[500], fontSize: 14, height: 1.5),
              ),
              const SizedBox(height: 32),
              
              // Date Picker Mock
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF0D1117),
                  hintText: "mm/dd/yyyy",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: const Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 24),

              // Checkbox
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D1117),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: _isChecked ? const Color(0xFF00AAFF) : Colors.transparent),
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      activeColor: const Color(0xFF00AAFF),
                      onChanged: (v) => setState(() => _isChecked = v!),
                    ),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("I confirm I am over 18 years old.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                          Text("I understand that content is locally stored.", style: TextStyle(color: Colors.grey, fontSize: 11)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _handleVerify,
                  icon: const Icon(Icons.key),
                  label: const Text("Verify & Enter Vault"),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF00AAFF),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.go('/library'),
                child: Text("Cancel and return to library", style: TextStyle(color: Colors.grey[500], decoration: TextDecoration.underline)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}