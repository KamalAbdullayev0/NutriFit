import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutri_fit/domain/entities/user/user.dart';
import 'package:nutri_fit/domain/usecases/user/user.dart';
import 'package:nutri_fit/service_locator.dart';
import 'package:rxdart/rxdart.dart';

class UserController {
  final carbsController = BehaviorSubject<num>.seeded(0);
  final fatController = BehaviorSubject<num>.seeded(0);
  final caloriesController = BehaviorSubject<num>.seeded(0);
  final proteinController = BehaviorSubject<num>.seeded(0);

  UserController() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        fetchData();
      } else {
        resetData();
      }
    });
  }

  void updateCarbs(num value) {
    carbsController.add(value);
  }

  void updateFat(num value) {
    fatController.add(value);
  }

  void updateCalories(num value) {
    caloriesController.add(value);
  }

  void updateProtein(num value) {
    proteinController.add(value);
  }

  Future<void> fetchData() async {
    try {
      var result = await sl<GetUserDataUseCase>().call();
      result.fold(
        (l) {
          print('Ошибка при загрузке данных: $l');
        },
        (data) {
          if (data != null) {
            UserInfoEntity result = data;
            print(
                'Данные успешно загружены: carbs=${result.carbs}, fat=${result.fat}, calories=${result.calories}, protein=${result.protein}');
            updateCarbs(result.carbs ?? 0);
            updateFat(result.fat ?? 0);
            updateCalories(result.calories ?? 0);
            updateProtein(result.protein ?? 0);
          } else {
            print('Данные пользователя отсутствуют');
          }
        },
      );
    } catch (e) {
      print('Ошибка при загрузке данных: $e');
    }
  }

  void resetData() {
    updateCarbs(0);
    updateFat(0);
    updateCalories(0);
    updateProtein(0);
  }

  void incrementCarbs(num value) {
    final newCarbs = (carbsController.value + value).toDouble();
    updateCarbs(newCarbs);
  }

  void incrementFat(num value) {
    final newFat = (fatController.value + value).toDouble();
    updateFat(newFat);
  }

  void incrementCalories(num value) {
    final newCalories = (caloriesController.value + value).toDouble();
    updateCalories(newCalories);
  }

  void incrementProtein(num value) {
    final newProtein = (proteinController.value + value).toDouble();
    updateProtein(newProtein);
  }

  void dispose() {
    carbsController.close();
    fatController.close();
    caloriesController.close();
    proteinController.close();
  }
}
