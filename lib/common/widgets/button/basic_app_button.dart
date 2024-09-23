import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final Color backgroundColor; // Добавляем цвет фона как параметр

  const BasicAppButton({
    this.height,
    required this.onPressed,
    required this.title,
    this.backgroundColor = Colors.blue, // Добавляем значение по умолчанию
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
        backgroundColor: backgroundColor, // Используем переданный цвет
      ),
      onPressed: onPressed,
      child: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}
