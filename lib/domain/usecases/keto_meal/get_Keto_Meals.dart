import 'package:dartz/dartz.dart';
import 'package:nutri_fit/core/usecase/usecase.dart';
import 'package:nutri_fit/domain/repository/keto_meal/keto_meal.dart';
import 'package:nutri_fit/service_locator.dart';

class GetKetoMealsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<KetoMealRepository>().getKetoMeals();
  }
}
