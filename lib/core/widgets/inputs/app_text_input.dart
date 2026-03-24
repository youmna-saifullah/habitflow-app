import 'package:flutter/material.dart';

/// Reusable text input field with app-styled defaults.
class AppTextInput extends StatelessWidget {
  /// Creates a text input widget.
  const AppTextInput({
    required this.label,
    required this.hint,
    this.controller,
    this.keyboardType,
    super.key,
  });

  /// Field label text.
  final String label;

  /// Field hint text.
  final String hint;

  /// Optional text editing controller.
  final TextEditingController? controller;

  /// Optional keyboard type.
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label, hintText: hint),
    );
  }
}
