import 'package:dartz/dartz.dart';
import 'package:nutri_fit/core/usecase/usecase.dart';
import 'package:nutri_fit/domain/entities/keto_meal/keto_meal.dart';
import 'package:nutri_fit/domain/repository/add_meal/add_meal.dart';
import 'package:nutri_fit/service_locator.dart';

class AddMealUseCase implements UseCase<Either<String, String>, MealEntity> {

  @override
  Future<Either<String, String>> call({MealEntity? params}) async {
    if (params == null) {
      return Left("MealEntity is required");
    }

    return await sl<AddMealRepository>().addmeal(params);
  }
}
