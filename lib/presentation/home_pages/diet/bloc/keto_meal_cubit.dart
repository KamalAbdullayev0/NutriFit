import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/data/models/keto_meals/keto_meals.dart';
import 'package:nutri_fit/domain/entities/keto_meal/keto_meal.dart';
import 'package:nutri_fit/domain/usecases/keto_meal/get_Keto_Meals.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/keto_meal_state.dart';
import 'package:nutri_fit/service_locator.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class KetoMealCubit extends Cubit<KetoMealState> {
  KetoMealCubit() : super(KetoMealLoading());

  Future<void> getKetoMeals() async {
    final result = await sl<GetKetoMealsUseCase>().call();
    result.fold(
      (l) => emit(KetoMealFailure()),
      (data) => emit(KetoMealSuccess(ketoMeals: data)),
    );
  }

  void fetchMealsForCategory(String category) async {
    try {
      print("Fetching meals for category: $category"); // Start of function
      emit(KetoMealLoading());

      // Firestore query
      var data = await firestore
          .collection('keto-meals')
          .where('category', isEqualTo: category)
          .get();

      List<MealEntity> ketomeal = [];
      for (var element in data.docs) {
        var ketomealModel = MealModel.fromJson(element.data());
        var data = element.data();
        print('Fetched data: $data');
        ketomealModel.ketomealId = element.reference.id;
        ketomeal.add(ketomealModel.toEntity());
      }

      emit(KetoMealSuccess(ketoMeals: ketomeal)); // Emit success state
    } catch (e) {
      // If there is an error
      print("Error occurred: $e"); // Print the error message
      emit(KetoMealFailure()); // Emit failure state
    }
  }
}
