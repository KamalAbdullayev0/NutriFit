import 'package:dartz/dartz.dart';

abstract class KetoMealRepository {
  Future<Either> getKetoMeals();
}
