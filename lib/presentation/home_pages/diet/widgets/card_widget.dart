import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nutri_fit/common/widgets/macro_info_widget/macro_info_widget.dart';
import 'package:nutri_fit/common/widgets/progress_indicator/progress_indicator.dart';
import 'package:nutri_fit/domain/entities/user/user.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/user_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/user_rx.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/user_state.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("CardWidget: Building widget...");
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserSuccess) {
          print("CardWidget: User data loaded successfully.");
          return _buildCard(state.user);
        }
        if (state is UserFailure) {
          print("CardWidget: Error loading user data.");
          return const Center(
            child: Text(
              'Ошибка загрузки данных, попробуйте позже.',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          );
        }

        print("CardWidget: Initial or loading state.");
        return Container();
      },
    );
  }

  Widget _buildCard(UserInfoEntity user) {
    print("CardWidget: Building card with user data...");
    final userController = GetIt.I<UserController>();

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SizedBox(
        height: 240,
        width: double.infinity,
        child: Card(
          color: const Color.fromARGB(255, 6, 113, 213),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    StreamBuilder<num>(
                      stream: userController.proteinController,
                      builder: (context, snapshot) {
                        final protein = snapshot.data ?? 0;
                        print("CardWidget: Protein value - $protein");
                        return MacroInfoWidget(
                          width: 150,
                          label: 'Protein',
                          progress: protein / (user.necessaryProtein ?? 100),
                          value:
                              '$protein / ${(user.necessaryProtein ?? 100).toInt()} g',
                          color: protein < (user.necessaryProtein ?? 100)
                              ? Colors.red[400] ?? Colors.red
                              : Colors.green[400] ?? Colors.green,
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    StreamBuilder<num>(
                      stream: userController.carbsController,
                      builder: (context, snapshot) {
                        final carbs = snapshot.data ?? 0;
                        print("CardWidget: Carbs value - $carbs");
                        return MacroInfoWidget(
                          width: 150,
                          label: 'Carbs',
                          progress: carbs / (user.necessaryCarbs ?? 100),
                          value:
                              '$carbs / ${(user.necessaryCarbs ?? 100).toInt()} g',
                          color: carbs < (user.necessaryCarbs ?? 100)
                              ? Colors.orange[400] ?? Colors.orange
                              : Colors.green[400] ?? Colors.green,
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    StreamBuilder<num>(
                      stream: userController.fatController,
                      builder: (context, snapshot) {
                        final fat = snapshot.data ?? 0;
                        print("CardWidget: Fat value - $fat");
                        return MacroInfoWidget(
                          width: 150,
                          label: 'Fat',
                          progress: fat / (user.necessaryFat ?? 100),
                          value:
                              '$fat / ${(user.necessaryFat ?? 100).toInt()} g',
                          color: fat < (user.necessaryFat ?? 100)
                              ? Colors.yellow[600] ?? Colors.yellow
                              : Colors.green[400] ?? Colors.green,
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(width: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 3,
                    ),
                    StreamBuilder<num>(
                      stream: userController.caloriesController,
                      builder: (context, snapshot) {
                        final calories = snapshot.data ?? 0;
                        print("CardWidget: Calories value - $calories");
                        return ProgressIndicatorWidget(
                          label: 'Calories',
                          progress:
                              '$calories / ${user.necessaryCalories ?? 0}',
                          value: calories.toDouble() /
                              (user.necessaryCalories ?? 100).toDouble(),
                          height: 140,
                          strokeWidth: 10.0,
                          backgroundColor: Colors.grey[300]!,
                          progressColor: Colors.green,
                          labelTextStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          progressTextStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.white54,
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
