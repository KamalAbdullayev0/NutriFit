import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final String label;
  final double value;
  final String progress;
  final double height;

  const ProgressIndicatorWidget({
    super.key,
    required this.label,
    required this.value,
    required this.progress,
    this.height = 50.0, // Устанавливаем значение по умолчанию
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height,
          width: height,
          child: CircularProgressIndicator(
            value: value,
            backgroundColor: Colors.black,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.greenAccent),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(label, style: const TextStyle(color: Colors.white)),
        Text(progress, style: const TextStyle(color: Colors.white54)),
      ],
    );
  }
}
