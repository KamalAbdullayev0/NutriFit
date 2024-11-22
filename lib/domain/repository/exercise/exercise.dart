import 'package:dartz/dartz.dart';

abstract class ExerciseRepository {
  Future<Either> getExercise({String? category});
}
