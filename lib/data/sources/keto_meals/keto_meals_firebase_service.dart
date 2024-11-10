import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:nutri_fit/data/models/keto_meals/keto_meals.dart';
import 'package:nutri_fit/domain/entities/keto_meal/keto_meal.dart';

abstract class KetoMealsFirebaseService {
  Future<Either> getKetoMeals();
}

class KetoMealsFirebaseServiceImpl implements KetoMealsFirebaseService {
  @override
  Future<Either> getKetoMeals() async {
    try {
      List<MealEntity> ketomeal = [];
      var data = await FirebaseFirestore.instance
          .collection('keto-meals')
          .orderBy('date', descending: true)
          .get();

      for (var element in data.docs) {
        var ketomealModel = MealModel.fromJson(element.data());
        var data = element.data();
        print('Fetched data: $data');
        ketomealModel.ketomealId = element.reference.id;
        ketomeal.add(ketomealModel.toEntity());
      }

      return Right(ketomeal);
    } catch (e) {
      print('Error fetching keto meals: ${e.toString()}');
      return Left(('An error occurred: ${e.toString()}'));
    }
  }
}
