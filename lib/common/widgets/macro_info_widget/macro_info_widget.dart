import 'package:flutter/material.dart';

class MacroInfoWidget extends StatelessWidget {
  final String label;
  final double progress;
  final String value;
  final double height;

  const MacroInfoWidget({
    Key? key,
    required this.label,
    required this.progress,
    required this.value,
    this.height = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white)),
        SizedBox(height: 4),
        Container(
          height: height,
          width: 80,
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white24,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4),
        Text(value, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
