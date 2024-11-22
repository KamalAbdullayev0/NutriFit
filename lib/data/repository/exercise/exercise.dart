import 'package:dartz/dartz.dart';
import 'package:nutri_fit/data/sources/exercise/exercise.dart';
import 'package:nutri_fit/domain/repository/exercise/exercise.dart';
import 'package:nutri_fit/service_locator.dart';

class ExerciseRepositoryImpl extends ExerciseRepository {
  @override
  Future<Either> getExercise({String? category}) async {
    try {
      if (category != null) {
        return await sl<ExerciseFirebaseService>()
            .getExercise(category: category);
      } else {
        return await sl<ExerciseFirebaseService>().getExercise();
      }
    } catch (error) {
      return Left(error);
    }
  }
}
