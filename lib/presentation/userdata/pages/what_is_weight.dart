import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/common/widgets/appbar/app_bar.dart';
import 'package:nutri_fit/presentation/router/router.gr.dart';

@RoutePage()
class WhatIsAgeWeightScreen extends StatefulWidget {
  @override
  _WhatIsAgeWeightScreenState createState() => _WhatIsAgeWeightScreenState();
}

class _WhatIsAgeWeightScreenState extends State<WhatIsAgeWeightScreen> {
  int selectedAge = 40;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        backgroundColor: Colors.white,
        hideBack: false,
        logoColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "What's your",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "current weight?",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 100),
          SizedBox(
            height: 100, // Высота "колеса"
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollEndNotification) {
                  final offset = _scrollController.offset;
                  final middleIndex =
                      (offset / 20).round(); // 80 - ширина одного элемента
                  setState(() {
                    selectedAge = 40 + middleIndex;
                  });
                  _scrollController.animateTo(
                    middleIndex * 10.0,
                    duration: const Duration(milliseconds: 10),
                    curve: Curves.easeInOut,
                  );
                }
                return true;
              },
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 101,
                itemBuilder: (context, index) {
                  int age = 30 + index;
                  bool isLongLine = age % 10 == 0;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAge = age;
                      });
                      _scrollController.animateTo(
                        index * 10.0, // 80 - ширина одного элемента
                        duration: const Duration(milliseconds: 10),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      width: 20, // Ширина одного элемента
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: isLongLine ? 60 : 30,
                            width: 3,
                            color: isLongLine
                                ? const Color.fromARGB(255, 200, 75, 66)
                                : Colors.black,
                          ),
                          if (isLongLine)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                '$age',
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 80,
            width: 4,
            color: const Color.fromARGB(255, 217, 21, 7),
          ),
          Text(
            '$selectedAge',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 60,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              // context.router.push(());
              context.router.push(const WhatIsGenderRoute());

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
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
