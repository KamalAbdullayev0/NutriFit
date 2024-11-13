import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/domain/usecases/keto_meal/get_Keto_Meals.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/keto_meal_state.dart';
import 'package:nutri_fit/service_locator.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class KetoMealCubit extends Cubit<KetoMealState> {
  KetoMealCubit() : super(KetoMealLoading());

  Future<void> getKetoMeals({String? category}) async {
    final result = await sl<GetKetoMealsUseCase>().call(params: category);
    print("GetKetoMeals result: $result");
    result.fold(
      (l) => emit(KetoMealFailure()),
      (data) => emit(KetoMealSuccess(ketoMeals: data)),
    );
  }
  
}
