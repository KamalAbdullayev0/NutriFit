import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/common/widgets/appbar/app_bar.dart';
import 'package:nutri_fit/presentation/router/router.gr.dart';
import 'package:nutri_fit/presentation/userdata/bloc/user_rxdart.dart';

@RoutePage()
class WhatIsGenderScreen extends StatelessWidget {
  final UserBloc userBloc;

  const WhatIsGenderScreen({super.key, required this.userBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BasicAppbar(
        hideBack: false,
        logoColor: Colors.black,
      ),
      body: _WhatIsGenderScreenBody(userBloc: userBloc),
    );
  }
}

class _WhatIsGenderScreenBody extends StatelessWidget {
  final UserBloc userBloc;
  final List<String> genders = ["👦🏻  Male", "👩🏻  Female"];

  _WhatIsGenderScreenBody({super.key, required this.userBloc});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: userBloc.gender,
      builder: (context, snapshot) {
        final selectedGender = snapshot.data;

        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const Text(
                'What is your gender?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Gender selection
              Column(
                children: genders.map((gender) {
                  return GestureDetector(
                    onTap: () => userBloc.changeGender(gender),
                    child: Container(
                      width: 340,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selectedGender == gender
                            ? Colors.red
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        gender,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 10),
              const Text(
                'Your privacy is our priority. We will never',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              const Text(
                'share your personal information with anyone.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              const Spacer(),

              // Continue button
              ElevatedButton(
                onPressed: () async {
                  userBloc.genderSet(selectedGender ?? '');
                  void getCalories() {
                    if (userData.gender == '👦🏻  Male') {
                      userData.necessaryCalories = (10 * userData.weight! +
                              6.25 * userData.height! -
                              5 * userData.age! +
                              5)
                          .toInt();
                    } else {
                      userData.necessaryCalories = (10 * userData.weight! +
                              6.25 * userData.height! -
                              5 * userData.age! -
                              161)
                          .toInt();
                    }
                  }

                  void getProtein() {
                    userData.necessaryProtein = (userData.weight! * 2).toInt();
                  }

                  void getFat() {
                    userData.necessaryFat =
                        (userData.necessaryCalories! * 0.25 / 9).toInt();
                  }

                  void getCarbs() {
                    userData.necessaryCarbs = ((userData.necessaryCalories! -
                                (userData.necessaryProtein! * 4 +
                                    userData.necessaryFat! * 9)) /
                            4)
                        .toInt();
                  }

                  getCalories();
                  getProtein();
                  getFat();
                  getCarbs();
                  userBloc.calculatee(
                    userData.necessaryCalories!,
                    userData.necessaryProtein!,
                    userData.necessaryFat!,
                    userData.necessaryCarbs!,
                  );

                  final userDataFull = userBloc.getUserData();
                  if (userDataFull.gender != null) {
                    try {
                      await userBloc.sendUserDataToFirebase(userDataFull);
                      print('User info submitted');
                      await context.router.replaceAll([const HomeRoute()]);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Ошибка при отправке данных: $e')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Пожалуйста, выберите пол')),
                    );
                  }
                },
                child: const Text(
                  'CONTINUE',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
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
    );
  }
}
