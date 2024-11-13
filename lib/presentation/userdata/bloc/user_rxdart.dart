import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserBloc {
  final goalController = BehaviorSubject<String>.seeded('');
  final ageController = BehaviorSubject<int>.seeded(30);
  final genderController = BehaviorSubject<String>.seeded('');
  final heightController = BehaviorSubject<int>.seeded(120);
  final weightController = BehaviorSubject<int>.seeded(40);

  void goalSet(String value) {
    goalController.sink.add(value);
    userData.goal = value;
  }

  void ageSet(int value) {
    ageController.sink.add(value);
    userData.age = value;
  }

  void genderSet(String value) {
    genderController.sink.add(value);
    userData.gender = value;
  }

  void heightSet(int value) {
    heightController.sink.add(value);
    userData.height = value;
  }

  void weightSet(int value) {
    weightController.sink.add(value);
    userData.weight = value;
  }

  void calculatee(int value1, int value2, int value3, int value4) {
    userData.necessaryCalories = value1;
    userData.necessaryProtein = value2;
    userData.necessaryFat = value3;
    userData.necessaryCarbs = value4;
  }

  Function(String) get changeGoal => goalController.sink.add;
  Function(int) get changeAge => ageController.sink.add;
  Function(String) get changeGender => genderController.sink.add;
  Function(int) get changeHeight => heightController.sink.add;
  Function(int) get changeWeight => weightController.sink.add;

  Stream<String> get goal => goalController.stream;
  Stream<int> get age => ageController.stream;
  Stream<String> get gender => genderController.stream;
  Stream<int> get height => heightController.stream;
  Stream<int> get weight => weightController.stream;

  UserData getUserData() {
    return UserData(
      goal: userData.goal,
      age: userData.age,
      gender: userData.gender,
      height: userData.height,
      weight: userData.weight,
      calories: 0,
      carbs: 0,
      fat: 0,
      protein: 0,
      necessaryCalories: userData.necessaryCalories,
      necessaryCarbs: userData.necessaryCarbs,
      necessaryFat: userData.necessaryFat,
      necessaryProtein: userData.necessaryProtein,
    );
  }

  // Отправка данных в Firebase
  Future<void> sendUserDataToFirebase(UserData userData) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      var user = firebaseAuth.currentUser;

      if (user == null) {
        throw Exception('User not logged in');
      }

      String uId = user.uid;

      // Use set with merge: true to update the document fields without overwriting the entire document
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(uId)
          .set(userData.toMap(), SetOptions(merge: true));

      print('User data successfully submitted to Firebase');
    } catch (e) {
      print('Error submitting user data to Firebase: $e');
      rethrow; // Optionally rethrow the error to propagate it to the caller
    }
  }

  // Закрываем потоки
  void dispose() {
    goalController.close();
    ageController.close();
    genderController.close();
    heightController.close();
    weightController.close();
  }
}

UserData userData = UserData();

class UserData {
  String? goal;
  int? age;
  String? gender;
  int? height;
  int? weight;
  int? calories;
  int? carbs;
  int? fat;
  int? protein;
  int? necessaryCalories;
  int? necessaryCarbs;
  int? necessaryFat;
  int? necessaryProtein;

  UserData(
      {this.goal,
      this.age,
      this.gender,
      this.height,
      this.weight,
      this.calories,
      this.carbs,
      this.fat,
      this.protein,
      this.necessaryCalories,
      this.necessaryCarbs,
      this.necessaryFat,
      this.necessaryProtein});

  Map<String, dynamic> toMap() {
    return {
      'goal': goal,
      'age': age,
      'gender': gender,
      'height': height,
      'weight': weight,
      'calories': 0,
      'carbs': 0,
      'fat': 0,
      'protein': 0,
      'NecessaryCalories': necessaryCalories,
      'NecessaryCarbs': necessaryCarbs,
      'NecessaryFat': necessaryFat,
      'NecessaryProtein': necessaryProtein,
    };
  }
}
