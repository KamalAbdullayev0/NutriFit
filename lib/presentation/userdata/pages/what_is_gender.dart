import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Импорт Firebase Firestore
import 'package:nutri_fit/common/widgets/appbar/app_bar.dart'; // Ваши собственные импорты
import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/presentation/router/router.gr.dart'; // Использование AutoRoute для навигации

@RoutePage()
class WhatIsGenderScreen extends StatefulWidget {
  const WhatIsGenderScreen({super.key});

  @override
  State<WhatIsGenderScreen> createState() => _WhatIsGenderScreenState();
}

class _WhatIsGenderScreenState extends State<WhatIsGenderScreen> {
  String? selectedGoal;

  final List<String> goals = [
    "👦🏻  Male",
    "👩🏻  Female",
  ];

  void selectGoal(String goal) {
    setState(() {
      selectedGoal = goal;
    });
  }

  // Future<void> saveToFirestore() async {
  //   if (selectedGoal != null) {
  //     await FirebaseFirestore.instance
  //         .collection('Users')
  //         .doc('userId')
  //         .update({
  //       'goal': selectedGoal,
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BasicAppbar(
        hideBack: false,
        logoColor: Colors.black,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'What is your gender?',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ...goals.map((goal) {
              return GestureDetector(
                onTap: () => selectGoal(goal),
                child: Container(
                  width: 340,
                  height: 50,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: selectedGoal == goal ? Colors.red : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    goal,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 10),
            Text(
              'Your privacy is our priority.We will never',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            Text(
              'share your personal information with anyone.',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 470),
            ElevatedButton(
              onPressed: () {
                context.router.replaceAll([const HomeRoute()]);

                // saveToFirestore();
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
          ],
        ),
      ),
    );
  }
}
