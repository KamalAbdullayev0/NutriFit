import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nutri_fit/domain/entities/keto_meal/keto_meal.dart';

class MealModel {
  String? name;
  String? name1;
  num? calories;
  num? carbs;
  num? fat;
  num? protein;
  String? category;
  Timestamp? date;
  String? ketomealId;

  MealModel({
    required this.name,
    required this.name1,
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.protein,
    required this.category,
    required this.date,
    required this.ketomealId,
  });

  // Метод для инициализации из JSON-данных Firestore
  MealModel.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    name1 = data['name1'];
    calories = data['calories'];
    carbs = data['carbs'];
    fat = data['fat'];
    protein = data['protein'];
    category = data['category'];
    date = data['date'];
  }
}

extension MealModelX on MealModel {
  MealEntity toEntity() {
    return MealEntity(
      name: name!,
      name1: name1!,
      calories: calories!,
      carbs: carbs!,
      fat: fat!,
      protein: protein!,
      category: category!,
      date: date!,
      ketomealId: ketomealId!,
    );
  }
}
