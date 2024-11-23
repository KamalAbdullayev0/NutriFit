import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildDatePicker(BuildContext context) {
  final now = DateTime.now();
  final dayFormatter = DateFormat('E');

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
    child: SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          final date =
              now.add(Duration(days: index)).subtract(const Duration(days: 2));
          final isSelected = index == 2;

          return GestureDetector(
            onTap: () {
              // Handle the date selection
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected
                    ? Color.fromARGB(255, 15, 136, 248)
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  if (isSelected)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
              child: SizedBox(
                height: 40,
                width: 35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('d').format(date),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      dayFormatter.format(date),
                      style: TextStyle(
                        color: isSelected ? Colors.white70 : Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
