import 'package:dartz/dartz.dart';
import 'package:nutri_fit/domain/entities/keto_meal/keto_meal.dart';

abstract class AddMealRepository {
  Future<Either<String, String>> addmeal(MealEntity meal); // Изменяем dynamic на MealEntity
}
