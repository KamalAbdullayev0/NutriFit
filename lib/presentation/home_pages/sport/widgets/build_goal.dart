import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget buildGoalCard({
  required BuildContext context,
  required String title,
  required int currentValue,
  required int goalValue,
  required IconData emojiIcon,
  required Function() onTap,
}) {
  double progress = (currentValue / goalValue).clamp(0.0, 1.0);

  return SizedBox(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              CircularPercentIndicator(
                radius: MediaQuery.of(context).size.width / 5.4,
                lineWidth: 10.0,
                percent: progress,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      emojiIcon,
                      size: 36,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '$currentValue',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '/ $goalValue ${title == 'STEPS' ? 'Steps' : 'Cups'}',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                progressColor: Colors.pink,
                backgroundColor: Colors.grey.shade200,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
