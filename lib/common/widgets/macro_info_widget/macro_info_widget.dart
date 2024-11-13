import 'package:flutter/material.dart';

class MacroInfoWidget extends StatelessWidget {
  final String label;
  final double progress;
  final String value;
  final double height;
  final double width;
  final Color color;

  const MacroInfoWidget({
    super.key,
    required this.label,
    required this.progress,
    required this.value,
    this.height = 7,
    this.width = 80,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(height: 4),
        SizedBox(
          height: height,
          width: width,
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white24,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
