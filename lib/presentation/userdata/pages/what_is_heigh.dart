import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/common/widgets/appbar/app_bar.dart';
import 'package:nutri_fit/presentation/router/router.gr.dart';

@RoutePage()
class WhatIsAgeHeightScreen extends StatefulWidget {
  @override
  _WhatIsAgeHeightScreenState createState() => _WhatIsAgeHeightScreenState();
}

class _WhatIsAgeHeightScreenState extends State<WhatIsAgeHeightScreen> {
  int selectedAge = 120;

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "What's your heigt?",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 0),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 660,
                  width: 140,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 15, // Высота элемента списка
                    physics: const FixedExtentScrollPhysics(),
                    offAxisFraction: 0.45, // Убираем горизонтальное смещение
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedAge = 120 + index;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        int age = 120 + index;
                        bool isLongLine = age % 10 == 0;
                        return SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Линия, которая каждая десятая длиннее
                              Container(
                                width: isLongLine
                                    ? 60
                                    : 30, // Удлиненная каждая 10-я линия
                                height: 2, // Толщина линии
                                color: isLongLine
                                    ? const Color.fromARGB(255, 240, 101, 91)
                                    : Colors.black, // Цвет линии
                              ),
                              isLongLine
                                  ? Text(
                                      '$age',
                                      style: TextStyle(fontSize: 14),
                                    )
                                  : const SizedBox(),
                              const SizedBox(
                                  width:
                                      10), // Расстояние между линией и текстом
                            ],
                          ),
                        );
                      },
                      childCount:
                          101, // Количество элементов: возраст от 18 до 100
                    ),
                  ),
                ),
                Container(
                  width: 100, // Удлиненная каждая 10-я линия
                  height: 3, // Толщина линии
                  color: const Color.fromARGB(255, 217, 21, 7), // Цвет линии
                ),
                SizedBox(
                  width: 130,
                  child: Text(
                    '$selectedAge', // Показываем выбранное число
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.router.push(WhatIsAgeWeightRoute());

              // Логика для сохранения возраста или навигации
            },
            child: const Text(
              'CONTINUE',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
            ),
          ),
          SizedBox(height: 36),
        ],
      ),
    );
  }
}
