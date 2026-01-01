// lib/core/utils/extensions.dart

extension StringExtensions on String {
  /// Capitalizes the first letter of the string
  /// Example: "hello" → "Hello"
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
