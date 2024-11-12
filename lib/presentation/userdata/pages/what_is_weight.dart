import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/common/widgets/appbar/app_bar.dart';
import 'package:nutri_fit/presentation/router/router.gr.dart';
import 'package:nutri_fit/presentation/userdata/bloc/user_rxdart.dart';

@RoutePage()
class WhatIsAgeWeightScreen extends StatelessWidget {
  final UserBloc userBloc;

  const WhatIsAgeWeightScreen({super.key, required this.userBloc});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return StreamBuilder<int>(
      stream: userBloc.weight,
      builder: (context, snapshot) {
        final selectedWeight = snapshot.data ?? 50;

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
                "What's your current weight?",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                height: 100,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollEndNotification) {
                      final offset = scrollController.offset;
                      final middleIndex = (offset / 20).round();
                      final calculatedWeight = 40 + middleIndex;

                      // Update weight in UserBloc
                      userBloc.changeWeight(calculatedWeight);

                      scrollController.animateTo(
                        middleIndex * 20.0,
                        duration: const Duration(milliseconds: 10),
                        curve: Curves.easeInOut,
                      );
                    }
                    return true;
                  },
                  child: ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 101,
                    itemBuilder: (context, index) {
                      int weight = 30 + index;
                      bool isLongLine = weight % 10 == 0;
                      return GestureDetector(
                        onTap: () {
                          userBloc.changeWeight(weight);
                          scrollController.animateTo(
                            index * 20.0,
                            duration: const Duration(milliseconds: 10),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          width: 20,
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
                                    '$weight',
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
                '$selectedWeight',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  userBloc.weightSet(selectedWeight);
                  print(userData.goal);
                  print(userData.age);
                  print(userData.height);
                  context.router.push(const WhatIsGenderRoute());
                },
                child: const Text(
                  'CONTINUE',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45),
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
