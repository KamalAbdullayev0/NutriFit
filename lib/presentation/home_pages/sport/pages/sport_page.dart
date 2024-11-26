import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/common/widgets/root_appbar/root_appbar.dart';
import 'package:nutri_fit/presentation/home_pages/sport/bloc/sport_bloc_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/sport/bloc/water_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/sport/widgets/Water.dart';
import 'package:nutri_fit/presentation/home_pages/sport/widgets/build_goal.dart';
import 'package:nutri_fit/presentation/home_pages/sport/widgets/exercises_vertical.dart';
import 'package:nutri_fit/presentation/home_pages/sport/widgets/get_info_cal_dis_widget.dart';

@RoutePage()
class SportPageWidget extends StatelessWidget {
  const SportPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 240, 240),
      appBar: RootAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Health Goals',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildGoalCard(
                    context: context,
                    title: 'STEPS',
                    currentValue:
                        1582, // Рандомное количество шагов, приблизительно 1187 м
                    goalValue: 8000,
                    emojiIcon: Icons.directions_walk,
                    onTap: () {
                      print("Steps card tapped!");
                    },
                  ),
                  BlocProvider(
                    create: (context) => WaterCounterCubit(),
                    child: WaterGoalCard(),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  buildInfoButton(
                    
                    context: context,
                    icon: Icons.local_fire_department,
                    label: 'Calories ',
                    value: '63 call',
                  ),
                  buildInfoButton(
                    context: context,
                    icon: Icons.directions_walk,
                    label: 'Distance',
                    value: '1187 м',
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Exercises',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              BlocProvider(
                create: (context) => ExerciseCubit()..getKetoMeals(),
                child: const ExerciseVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
