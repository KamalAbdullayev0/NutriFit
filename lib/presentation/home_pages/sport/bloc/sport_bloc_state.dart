import 'package:nutri_fit/domain/entities/exercise/exercise.dart';

abstract class ExerciseState {}

class ExerciseLoading extends ExerciseState {}

class ExerciseSuccess extends ExerciseState {
  final List<ExerciseEntity> exercises;

  ExerciseSuccess({required this.exercises});
}

class ExerciseFailure extends ExerciseState {}


