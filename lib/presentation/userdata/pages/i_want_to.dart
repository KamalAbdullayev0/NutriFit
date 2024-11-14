import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/common/widgets/appbar/app_bar.dart';
import 'package:nutri_fit/presentation/router/router.gr.dart';
import 'package:nutri_fit/presentation/userdata/bloc/user_rxdart.dart';

@RoutePage()
class IWantToScreen extends StatelessWidget {
  final UserBloc userBloc;

  IWantToScreen({required this.userBloc, super.key});

  final List<String> goals = [
    "Lose weight",
    "Manage a health condition",
    "Increase energy",
    "Live a healthier lifestyle",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BasicAppbar(
        backgroundColor: Colors.white,
        hideBack: false,
        logoColor: Colors.black,
      ),
      body: StreamBuilder<String>(
        stream: userBloc.goal,
        builder: (context, snapshot) {
          final selectedGoal = snapshot.data ?? '';
          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'I want to...',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ...goals.map((goal) {
                  return GestureDetector(
                    onTap: () => userBloc.changeGoal(goal),
                    child: Container(
                      width: 340,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selectedGoal == goal
                            ? Colors.red
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        goal,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                const SizedBox(height: 10),
                const Text(
                  'You can select only one goal',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    userBloc.goalSet(selectedGoal);
                    context.router.push(WhatIsAgeRoute());
                  },
                  child: const Text(
                    'CONTINUE',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 15,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          );
        },
      ),
    );
  }
}
