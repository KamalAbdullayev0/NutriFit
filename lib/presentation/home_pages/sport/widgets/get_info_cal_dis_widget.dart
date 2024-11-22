import 'package:flutter/material.dart';

Widget buildInfoButton({
  required BuildContext context,
  required IconData icon,
  required String label,
  required String value,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.44, // 40% ширины экрана
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.grey[50],
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.01),
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(0, 10),
        ),
      ],
      border: Border.all(color: Colors.black.withOpacity(0.07)),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 28,
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
