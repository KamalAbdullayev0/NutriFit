import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:nutri_fit/data/models/keto_meals/keto_meals.dart';
import 'package:nutri_fit/domain/entities/keto_meal/keto_meal.dart';

abstract class KetoMealsFirebaseService {
  Future<Either> getKetoMeals({String? category});
}

class KetoMealsFirebaseServiceImpl implements KetoMealsFirebaseService {
  @override
  Future<Either> getKetoMeals({String? category}) async {
    if (category == null) {
      try {
        print("Fetching all keto meals..."); // Отладочный вывод

        List<MealEntity> ketomeal = [];
        var data = await FirebaseFirestore.instance
            .collection('keto-meals')
            .orderBy('date', descending: true)
            .get();

        print(
            "Data fetched: ${data.docs.length} documents found."); // Вывод количества документов

        for (var element in data.docs) {
          print(
              "Processing document ID: ${element.reference.id}"); // Отладочный вывод ID документа

          var ketomealModel = MealModel.fromJson(element.data());
          ketomealModel.ketomealId = element.reference.id;
          ketomeal.add(ketomealModel.toEntity());

          print("Meal added: ${ketomealModel.name1}"); // Вывод названия блюда
        }

        print("All meals processed. Returning result."); // Завершающий вывод
        return Right(ketomeal);
      } catch (e) {
        print("Error occurred: ${e.toString()}"); // Вывод ошибки
        return Left(('An error occurred: ${e.toString()}'));
      }
    } else {
      try {
        print(
            "Fetching keto meals by category: $category"); // Отладочный вывод категории

        List<MealEntity> ketomeal = [];
        var data = await FirebaseFirestore.instance
            .collection('keto-meals')
            .where('category', isEqualTo: category)
            .get();

        print(
            "Data fetched: ${data.docs.length} documents found."); // Вывод количества документов

        for (var element in data.docs) {
          print(
              "Processing document ID: ${element.reference.id}"); // Отладочный вывод ID документа

          var ketomealModel = MealModel.fromJson(element.data());
          ketomealModel.ketomealId = element.reference.id;
          ketomeal.add(ketomealModel.toEntity());

          print("Meal added: ${ketomealModel.name1}"); // Вывод названия блюда
        }

        print("All meals processed. Returning result."); // Завершающий вывод
        return Right(ketomeal);
      } catch (e) {
        print("Error occurred: ${e.toString()}"); // Вывод ошибки
        return Left(('An error occurred: ${e.toString()}'));
      }
    }
  }
}
