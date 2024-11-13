import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nutri_fit/core/configs/theme/app_colors.dart';

Widget buildDatePicker(BuildContext context) {
  final now = DateTime.now();
  final dateFormatter = DateFormat('MMM');

  return Container(
    color: Colors.green[300],
    padding: const EdgeInsets.only(top: 0),
    child: SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 11,
        itemBuilder: (context, index) {
          final date =
              now.add(Duration(days: index)).subtract(const Duration(days: 5));
          final isSelected = index == 5;

          return GestureDetector(
            onTap: () {},
            child: Container(
              width: 54,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.green : AppColors.notification,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: isSelected ? AppColors.darkgreen : AppColors.orange,
                  width: isSelected ? 2.0 : 1.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('d').format(date),
                    style: TextStyle(
                      color: isSelected ? AppColors.background : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    dateFormatter.format(date),
                    style: TextStyle(
                      color: isSelected ? AppColors.background : Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
