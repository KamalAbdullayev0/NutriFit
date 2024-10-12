import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final String label;
  final double value;
  final String progress;
  final double height;

  const ProgressIndicatorWidget({
    Key? key,
    required this.label,
    required this.value,
    required this.progress,
    this.height = 50.0, // Устанавливаем значение по умолчанию
  }) : super(key: key);

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
            valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
          ),
        ),
        SizedBox(height: 8.0),
        Text(label, style: TextStyle(color: Colors.white)),
        Text(progress, style: TextStyle(color: Colors.white54)),
      ],
    );
  }
}
