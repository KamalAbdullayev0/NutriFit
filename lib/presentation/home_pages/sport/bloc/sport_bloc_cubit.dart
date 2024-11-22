import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/domain/usecases/exercise/exercise.dart';
import 'package:nutri_fit/presentation/home_pages/sport/bloc/sport_bloc_state.dart';
import 'package:nutri_fit/service_locator.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit() : super(ExerciseLoading());

  Future<void> getKetoMeals({String? category}) async {
    final result = await sl<GetExerciseUseCase>().call(params: category);
    result.fold(
      (l) => emit(ExerciseFailure()),
      (data) => emit(ExerciseSuccess(exercises: data)),
    );
  }
}
