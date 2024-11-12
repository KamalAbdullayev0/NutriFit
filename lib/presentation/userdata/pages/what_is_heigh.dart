import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/common/widgets/appbar/app_bar.dart';
import 'package:nutri_fit/presentation/router/router.gr.dart';
import 'package:nutri_fit/presentation/userdata/bloc/user_rxdart.dart';

@RoutePage()
class WhatIsAgeHeightScreen extends StatelessWidget {
  final UserBloc userBloc;
  const WhatIsAgeHeightScreen({super.key, required this.userBloc});

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
        stream: userBloc.height,
        builder: (context, snapshot) {
          final selectedHeight = snapshot.data ?? 160;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "What's your height?",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.32,
                      height: MediaQuery.of(context).size.height * 0.66,
                      child: ListWheelScrollView.useDelegate(
                        itemExtent: 15,
                        physics: const FixedExtentScrollPhysics(),
                        offAxisFraction: 0.45,
                        onSelectedItemChanged: (index) {
                          userBloc.changeHeight(120 + index);
                        },
                        childDelegate: ListWheelChildBuilderDelegate(
                          builder: (context, index) {
                            int height = 120 + index;
                            bool isLongLine = height % 10 == 0;
                            return SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: isLongLine ? 60 : 30,
                                    height: 2,
                                    color: isLongLine
                                        ? const Color.fromARGB(
                                            255, 240, 101, 91)
                                        : Colors.black,
                                  ),
                                  if (isLongLine)
                                    Text(
                                      '$height',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            );
                          },
                          childCount: 101,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '$selectedHeight',
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
              ElevatedButton(
                onPressed: () {
                  userBloc.heightSet(selectedHeight);

                  context.router.push(const WhatIsAgeWeightRoute());
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
          );
        },
      ),
    );
  }
}
