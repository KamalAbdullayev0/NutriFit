import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/presentation/home_pages/sport/bloc/water_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/sport/bloc/water_state.dart';
import 'package:nutri_fit/presentation/home_pages/sport/widgets/build_goal.dart';

class WaterGoalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterCounterCubit, WaterCounterState>(
      builder: (context, state) {
        int currentWater = 0;

        if (state is WaterCounterLoaded) {
          currentWater = state.count;
        }

        return buildGoalCard(
          context: context,
          title: 'WATER',
          currentValue: currentWater,
          goalValue: 8,
          emojiIcon: Icons.water_drop,
          onTap: () {
            context.read<WaterCounterCubit>().incrementWater();
          },
        );
      },
    );
  }
}
