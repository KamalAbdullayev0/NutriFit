import 'package:dartz/dartz.dart';
import 'package:nutri_fit/data/sources/keto_meals/keto_meals_firebase_service.dart';
import 'package:nutri_fit/domain/repository/keto_meal/keto_meal.dart';
import 'package:nutri_fit/service_locator.dart';

class KetoMealsRepositoryImpl extends KetoMealRepository {
  @override
  Future<Either> getKetoMeals() async {
    return await sl<KetoMealsFirebaseService>().getKetoMeals();
  }
}
