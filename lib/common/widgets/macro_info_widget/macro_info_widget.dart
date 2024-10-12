import 'package:flutter/material.dart';

class MacroInfoWidget extends StatelessWidget {
  final String label;
  final double progress;
  final String value;
  final double height;

  const MacroInfoWidget({
    super.key,
    required this.label,
    required this.progress,
    required this.value,
    this.height = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 4),
        SizedBox(
          height: height,
          width: 80,
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white24,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
