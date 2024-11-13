import 'package:nutri_fit/domain/entities/user/user.dart';

class UserInfoModel {
  String? name;
  String? email;
  String? goal;
  num? age;
  num? height;
  num? weight;
  String? gender;
  num? calories;
  num? carbs;
  num? fat;
  num? protein;
  num? necessaryCalories;
  num? necessaryCarbs;
  num? necessaryFat;
  num? necessaryProtein;

  UserInfoModel({
    this.name,
    this.email,
    this.goal,
    this.age,
    this.height,
    this.weight,
    this.gender,
    this.calories,
    this.carbs,
    this.fat,
    this.protein,
    this.necessaryCalories,
    this.necessaryCarbs,
    this.necessaryFat,
    this.necessaryProtein,
  });

  // Initialize object from Firestore JSON data
  UserInfoModel.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    email = data['email'];
    goal = data['goal'];
    age = data['age'];
    height = data['height'];
    weight = data['weight'];
    gender = data['gender'];
    calories = data['calories'];
    carbs = data['carbs'];
    fat = data['fat'];
    protein = data['protein'];
    necessaryCalories = data['NecessaryCalories'];
    necessaryCarbs = data['NecessaryCarbs'];
    necessaryFat = data['NecessaryFat'];
    necessaryProtein = data['NecessaryProtein'];
  }

  // Convert model to Map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'goal': goal,
      'age': age,
      'height': height,
      'weight': weight,
      'gender': gender,
      'calories': calories,
      'carbs': carbs,
      'fat': fat,
      'protein': protein,
      'NecessaryCalories': necessaryCalories,
      'NecessaryCarbs': necessaryCarbs,
      'NecessaryFat': necessaryFat,
      'NecessaryProtein': necessaryProtein,
    };
  }
}

extension UserInfoModelX on UserInfoModel {
  UserInfoEntity toEntity() {
    return UserInfoEntity(
      name: name,
      email: email,
      goal: goal,
      age: age,
      height: height,
      weight: weight,
      gender: gender,
      calories: calories,
      carbs: carbs,
      fat: fat,
      protein: protein,
      necessaryCalories: necessaryCalories,
      necessaryCarbs: necessaryCarbs,
      necessaryFat: necessaryFat,
      necessaryProtein: necessaryProtein,
    );
  }
}
