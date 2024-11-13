import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutri_fit/domain/entities/keto_meal/keto_meal.dart';

abstract class AddMealFirebaseService {
  Future<Either<String, String>> addmeal(MealEntity meal);
}

class AddMealFirebaseServiceImpl implements AddMealFirebaseService {
  @override
  Future<Either<String, String>> addmeal(MealEntity meal) async {
    try {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      var userAuth = firebaseAuth.currentUser;
      
      if (userAuth == null) {
        return const Left('User not logged in');
      }

      String uId = userAuth.uid;
      
      // Обновляем информацию о пользователе в Firebase
      await firebaseFirestore.collection('Users').doc(uId).update({
        'calories': FieldValue.increment(meal.calories),
        'protein': FieldValue.increment(meal.protein),
        'carbs': FieldValue.increment(meal.carbs),
        'fat': FieldValue.increment(meal.fat),
      });
      
      return Right('Meal added successfully');  // Успешное выполнение
    } catch (e) {
      return Left('An error occurred: ${e.toString()}');  // Ошибка сервера
    }
  }
}
