import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final String label;
  final String prefix;
  final TextEditingController controller;
  final void Function(String) onChanged;

  const BuildTextField({
    required this.label,
    required this.prefix,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.green),
          border: const OutlineInputBorder(),
          prefixText: prefix),
      style: const TextStyle(color: Colors.green, fontSize: 25.0),
      onChanged: onChanged,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }
}
