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
          .orderBy('releaseDate', descending: true)
          .limit(5)
          .get();

      for (var element in data.docs) {
        var ketomealModel = MealModel.fromJson(element.data());
        ketomealModel.ketomealId = element.reference.id;
        ketomeal.add(ketomealModel.toEntity());
      }
      return Right(ketomeal);
    } catch (e) {
      return const Left('An error occurred');
    }
  }
}
