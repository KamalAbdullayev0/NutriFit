import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:nutri_fit/data/models/exercise/exercise.dart';
import 'package:nutri_fit/domain/entities/exercise/exercise.dart';

abstract class ExerciseFirebaseService {
  Future<Either> getExercise({String? category});
}

class ExerciseFirebaseServiceImpl implements ExerciseFirebaseService {
  @override
  Future<Either> getExercise({String? category}) async {
    if (category == null) {
      try {
        print('Getting keto meals');
        List<ExerciseEntity> exercise = [];
        var data = await FirebaseFirestore.instance
            .collection('exercises')
            .get();

        for (var element in data.docs) {
          var exerciseModel = ExerciseModel.fromJson(element.data());
          exercise.add(exerciseModel.toEntity());
        }

        return Right(exercise);
      } catch (e) {
        return Left(('An error occurred: ${e.toString()}'));
      }
    } else {
      try {
        print('Getting keto meals');
        List<ExerciseEntity> exercise = [];
        var data = await FirebaseFirestore.instance
            .collection('exercises')
            .where('category', isEqualTo: category)
            .get();

        for (var element in data.docs) {
          var exerciseModel = ExerciseModel.fromJson(element.data());
          exercise.add(exerciseModel.toEntity());
        }

        return Right(exercise);
      } catch (e) {
        return Left(('An error occurred: ${e.toString()}'));
      }
    }
  }
    
}
