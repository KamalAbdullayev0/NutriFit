// lib/features/product/presentation/cubit/add_meal_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/domain/entities/keto_meal/keto_meal.dart';
import 'package:nutri_fit/domain/usecases/add_meal/add_meal.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/add_meal_state.dart'; // Состояния для AddMealCubit
import 'package:nutri_fit/service_locator.dart'; // Для использования service locator

class AddMealCubit extends Cubit<AddMealState> {
  AddMealCubit() : super(AddMealLoading());

  Future<void> addMeal(MealEntity meal) async {
    // Получаем экземпляр AddMealUseCase из sl
    final addMealUseCase = sl<AddMealUseCase>();

    // Вызов UseCase с параметром meal
    final result = await addMealUseCase.call(params: meal);

    result.fold(
      (failure) =>
          emit(AddMealFailure()), // Если ошибка, выбрасываем состояние ошибки
      (_) => emit(AddMealSuccess()), // Успешное добавление
    );
  }
}
