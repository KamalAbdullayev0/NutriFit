import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/common/widgets/appbar/app_bar.dart';
import 'package:nutri_fit/presentation/router/router.gr.dart';
import 'package:nutri_fit/presentation/userdata/bloc/user_rxdart.dart';

@RoutePage()
class WhatIsAgeScreenWrapper extends StatelessWidget {
  final UserBloc userBloc;

  const WhatIsAgeScreenWrapper({required this.userBloc, super.key});

  @override
  Widget build(BuildContext context) {
    return WhatIsAgeScreen(userBloc: userBloc);
  }
}

class WhatIsAgeScreen extends StatelessWidget {
  final UserBloc userBloc;

  const WhatIsAgeScreen({super.key, required this.userBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BasicAppbar(
        backgroundColor: Colors.white,
        hideBack: false,
        logoColor: Colors.black,
      ),
      body: StreamBuilder<int>(
        stream: userBloc.age,
        builder: (context, snapshot) {
          final selectedAge = snapshot.data ?? 30;
          return Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "What's your age?",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 70,
                  physics: const FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    userBloc.changeAge(12 + index);
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
                                color: age == selectedAge
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            const Text(
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
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  userBloc.ageSet(selectedAge);

                  context.router.push(const WhatIsAgeHeightRoute());
                },
                child: const Text(
                  'CONTINUE',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          );
        },
      ),
    );
  }
}
