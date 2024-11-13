import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final String label;
  final double value;
  final String progress;
  final double height;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final TextStyle? labelTextStyle;
  final TextStyle? progressTextStyle;

  const ProgressIndicatorWidget({
    super.key,
    required this.label,
    required this.value,
    required this.progress,
    this.height = 50.0, // значение по умолчанию
    this.strokeWidth = 8.0, // ширина линии по умолчанию
    this.backgroundColor = Colors.black, // цвет фона по умолчанию
    this.progressColor =
        const Color.fromARGB(255, 41, 122, 0), // цвет прогресса
    this.labelTextStyle, // стиль текста метки
    this.progressTextStyle, // стиль текста прогресса
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Виджет CircularProgressIndicator
        SizedBox(
          height: height,
          width: height,
          child: CircularProgressIndicator(
            value: value, // Значение прогресса (0.0 - 1.0)
            backgroundColor: backgroundColor,
            strokeWidth: strokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          ),
        ),
        const SizedBox(height: 8.0),

        // Текст метки (label)
        Text(
          label,
          style: labelTextStyle ??
              const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
        ),

        // Текст прогресса (progress)
        Text(
          progress,
          style: progressTextStyle ??
              const TextStyle(
                color: Colors.white54,
                fontSize: 14,
              ),
        ),
      ],
    );
  }
}
