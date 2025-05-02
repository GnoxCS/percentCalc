import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final Color iconColor;

  const InputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[٠-٩0-9]'))],
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        labelText: labelText,
        prefixIcon: Icon(icon, color: iconColor),
      ),
    );
  }
}
