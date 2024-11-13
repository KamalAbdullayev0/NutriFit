import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/common/widgets/macro_info_widget/macro_info_widget.dart';
import 'package:nutri_fit/common/widgets/progress_indicator/progress_indicator.dart';
import 'package:nutri_fit/domain/entities/user/user.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/user_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/user_state.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserSuccess) {
          return _buildCard(state.user);
        }
        if (state is UserFailure) {
          return const Center(
            child: Text(
              'Ошибка загрузки данных, попробуйте позже.',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          );
        }

        return Container();
      },
    );
  }

  Widget _buildCard(UserInfoEntity user) {
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
                    // Protein
                    MacroInfoWidget(
                      width: 150,
                      label: 'Protein',
                      progress: (user.protein ?? 0).toDouble() /
                          (user.necessaryProtein ?? 100).toDouble(),
                      value:
                          '${(user.protein ?? 0).toInt()} / ${(user.necessaryProtein ?? 100).toInt()} g',
                      color:
                          (user.protein ?? 0) < (user.necessaryProtein ?? 100)
                              ? (Colors.red[400] ??
                                  Colors.red) // Устанавливаем цвет по умолчанию
                              : (Colors.green[400] ?? Colors.green),
                    ),
                    const SizedBox(
                        height: 10), // Добавляем отступы между элементами
                    // Carbs
                    MacroInfoWidget(
                      width: 150,
                      label: 'Carbs',
                      progress: (user.carbs ?? 0).toDouble() /
                          (user.necessaryCarbs ?? 100).toDouble(),
                      value:
                          '${(user.carbs ?? 0).toInt()} / ${(user.necessaryCarbs ?? 100).toInt()} g',
                      color: (user.carbs ?? 0) < (user.necessaryCarbs ?? 100)
                          ? (Colors.orange[400] ?? Colors.orange)
                          : (Colors.green[400] ?? Colors.green),
                    ),
                    const SizedBox(
                        height: 10), // Добавляем отступы между элементами
                    // Fat
                    MacroInfoWidget(
                      width: 150,
                      label: 'Fat',
                      progress: (user.fat ?? 0).toDouble() /
                          (user.necessaryFat ?? 100).toDouble(),
                      value:
                          '${(user.fat ?? 0).toInt()} / ${(user.necessaryFat ?? 100).toInt()} g',
                      color: (user.fat ?? 0) < (user.necessaryFat ?? 100)
                          ? (Colors.yellow[600] ?? Colors.yellow)
                          : (Colors.green[400] ?? Colors.green),
                    ),
                  ],
                ),
                const SizedBox(width: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    ProgressIndicatorWidget(
                      label: 'Calories',
                      progress:
                          '${user.calories ?? 0} / ${user.necessaryCalories ?? 0}', // Показ реального прогресса
                      value: (user.calories ?? 0).toDouble() /
                          (user.necessaryCalories ?? 100)
                              .toDouble(), // Значение прогресса
                      height: 140, // Устанавливаем высоту индикатора
                      strokeWidth: 10.0, // Ширина индикатора
                      backgroundColor: Colors.grey[300]!, // Фон
                      progressColor: Colors.green, // Цвет прогресса
                      labelTextStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      progressTextStyle:
                          const TextStyle(fontSize: 16, color: Colors.white54),
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
