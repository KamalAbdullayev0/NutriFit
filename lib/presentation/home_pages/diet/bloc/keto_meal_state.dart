import 'package:nutri_fit/domain/entities/keto_meal/keto_meal.dart';

abstract class KetoMealState {}

class KetoMealLoading extends KetoMealState {}

class KetoMealSuccess extends KetoMealState {
  final List<MealEntity> ketoMeals;

  KetoMealSuccess({required this.ketoMeals});
}

class KetoMealFailure extends KetoMealState {}
