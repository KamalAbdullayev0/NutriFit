import 'package:cloud_firestore/cloud_firestore.dart';

class MealEntity {
  final String name;
  final String name1;
  final num calories;
  final num carbs;
  final num fat;
  final num protein;
  final String category;
  final Timestamp date;

  MealEntity({
    required this.name,
    required this.name1,
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.protein,
    required this.category,
    required this.date,
  });
}
