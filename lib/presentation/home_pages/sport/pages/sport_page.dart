import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/common/widgets/root_appbar/root_appbar.dart';
import 'package:nutri_fit/presentation/home_pages/sport/widgets/build_goal.dart';
import 'package:nutri_fit/presentation/home_pages/sport/widgets/exercises_vertical.dart';
import 'package:nutri_fit/presentation/home_pages/sport/widgets/get_info_cal_dis_widget.dart';
import 'package:nutri_fit/presentation/home_pages/sport/bloc/sport_bloc_cubit.dart';

@RoutePage()
class SportPageWidget extends StatelessWidget {
  const SportPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    title: 'STEPS',
                    currentValue: 4000,
                    goalValue: 8000,
                    emojiIcon: Icons.directions_walk,
                    onTap: () {
                      print("Steps card tapped!");
                    },
                  ),
                  buildGoalCard(
                    title: 'WATER',
                    currentValue: 3, // Пример текущего значения (стаканов)
                    goalValue: 8, // Цель (в стаканах)
                    emojiIcon: Icons.water_drop, // Эмоджи: капля воды
                    onTap: () {
                      print("Water card tapped!");
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildInfoButton(
                    context: context,
                    icon: Icons.local_fire_department,
                    label: 'Distance',
                    value: '2000 м',
                  ),
                  buildInfoButton(
                    context: context,
                    icon: Icons.directions_walk,
                    label: 'Steps',
                    value: '4000 ',
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
