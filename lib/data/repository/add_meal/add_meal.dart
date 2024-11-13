import 'package:dartz/dartz.dart';
import 'package:nutri_fit/data/sources/add_meal/add_meal.dart';
import 'package:nutri_fit/domain/entities/keto_meal/keto_meal.dart';
import 'package:nutri_fit/domain/repository/add_meal/add_meal.dart';
import 'package:nutri_fit/service_locator.dart';

class AddMealRepositoryImpl extends AddMealRepository {
  @override
  Future<Either<String, String>> addmeal(MealEntity meal) async {
    try {
      // Получаем экземпляр AddMealFirebaseService из service_locator
      final addMealService = sl<AddMealFirebaseService>();
      
      // Вызываем метод addmeal у сервиса
      final result = await addMealService.addmeal(meal);
      
      // Если операция прошла успешно, возвращаем результат
      return result;
    } catch (error) {
      // Логируем ошибку для дальнейшего анализа
      print('Ошибка при добавлении блюда: ${error.toString()}');
      
      // Возвращаем ошибку в случае сбоя с детализированным сообщением
      return Left('Произошла ошибка: ${error.toString()}');
    }
  }
}
