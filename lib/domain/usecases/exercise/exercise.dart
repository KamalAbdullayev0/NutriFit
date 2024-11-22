import 'package:dartz/dartz.dart';
import 'package:nutri_fit/core/usecase/usecase.dart';
import 'package:nutri_fit/domain/repository/exercise/exercise.dart';
import 'package:nutri_fit/service_locator.dart';

class GetExerciseUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<ExerciseRepository>().getExercise(category: params);
  }
}
