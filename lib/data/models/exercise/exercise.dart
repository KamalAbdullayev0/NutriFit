import 'package:nutri_fit/domain/entities/exercise/exercise.dart';

class ExerciseModel {
  String? description;
  String? duration;
  String? name;
  String? name1;
  String? rest;
  String? sets;

  ExerciseModel({
    required this.description,
    required this.duration,
    required this.name,
    required this.name1,
    required this.rest,
    required this.sets,
  });

  // Инициализация из JSON-данных Firestore
  ExerciseModel.fromJson(Map<String, dynamic> data) {
    description = data['description'];
    duration = data['duration'];
    name = data['name'];
    name1 = data['name1'];
    rest = data['rest'];
    sets = data['sets'];
  }

  // Преобразование в Map для сохранения в Firestore
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'duration': duration,
      'name': name,
      'name1': name1,
      'rest': rest,
      'sets': sets,
    };
  }
}

extension ExerciseModelX on ExerciseModel {
  ExerciseEntity toEntity() {
    return ExerciseEntity(
      description: description!,
      duration: duration!,
      name: name!,
      name1: name1!,
      rest: rest!,
      sets: sets!,
    );
  }
}
