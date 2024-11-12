import 'package:nutri_fit/domain/entities/user/user.dart';

class UserInfoModel {
  String? name;
  String? email;
  String? want;
  num? age;
  num? height;
  num? weight;
  String? gender;
  num? calories;
  num? carbs;
  num? fat;
  num? protein;

  UserInfoModel({
    required this.name,
    required this.email,
    required this.want,
    required this.age,
    required this.height,
    required this.weight,
    required this.gender,
    required this.calories,
    required this.carbs,
    required this.fat,
    required this.protein,
  });

  // Метод для инициализации объекта из JSON-данных Firestore
  UserInfoModel.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    email = data['email'];
    want = data['want'];
    age = data['age'];
    height = data['height'];
    weight = data['weight'];
    gender = data['gender'];
    calories = data['calories'];
    carbs = data['carbs'];
    fat = data['fat'];
    protein = data['protein'];
  }

  // Метод для конвертации модели в Map для записи в Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'want': want,
      'age': age,
      'height': height,
      'weight': weight,
      'gender': gender,
      'calories': calories,
      'carbs': carbs,
      'fat': fat,
      'protein': protein,
    };
  }
}

extension UserInfoModelX on UserInfoModel {
  UserInfoEntity toEntity() {
    return UserInfoEntity(
      name: name!,
      email: email!,
      want: want!,
      age: age!,
      height: height!,
      weight: weight!,
      gender: gender!,
      calories: calories!,
      carbs: carbs!,
      fat: fat!,
      protein: protein!,
    );
  }
}
