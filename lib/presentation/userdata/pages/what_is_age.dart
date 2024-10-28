import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/common/widgets/appbar/app_bar.dart';
import 'package:nutri_fit/presentation/router/router.gr.dart'; // Для навигации

@RoutePage()
class WhatIsAgeScreen extends StatefulWidget {
  @override
  _WhatIsAgeScreenState createState() => _WhatIsAgeScreenState();
}

class _WhatIsAgeScreenState extends State<WhatIsAgeScreen> {
  int selectedAge = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BasicAppbar(
        backgroundColor: Colors.white,
        hideBack: false,
        logoColor: Colors.black,
      ),
      body: Column(
        children: [
          Text(
            "What's your age?",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListWheelScrollView.useDelegate(
              // overAndUnderCenterOpacity: 0.3,
              // diameterRatio: 1.5,
              // squeeze: 1.2,
              // offAxisFraction: -0.5,
              itemExtent: 70,
              physics: FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedAge = 12 + index;
                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  int age = 12 + index;
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$age",
                          style: TextStyle(
                            fontSize: age == selectedAge ? 45 : 34,
                            fontWeight: age == selectedAge ||
                                    age == selectedAge + 1 ||
                                    age == selectedAge - 1
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color:
                                age == selectedAge ? Colors.black : Colors.grey,
                          ),
                        ),
                        Text(
                          "  years old",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 89,
              ),
            ),
          ),
          Spacer(),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              context.router.push(const WhatIsAgeHeightRoute());
            },
            child: const Text(
              'CONTINUE',
              style: TextStyle(color: Colors.white),
            ), // Текст кнопки
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.red),
              padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 60, vertical: 15)),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
