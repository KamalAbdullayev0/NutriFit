import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/domain/usecases/keto_meal/get_Keto_Meals.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/keto_meal_state.dart';
import 'package:nutri_fit/service_locator.dart';

class KetoMealCubit extends Cubit<KetoMealState> {
  KetoMealCubit() : super(KetoMealLoading());

  Future<void> getKetoMeals() async {
    final result = await sl<GetKetoMealsUseCase>().call();
    result.fold(
      (l) => emit(KetoMealFailure()),
      (data) => emit(KetoMealSuccess(ketoMeals: data)),
    );
  }
}
