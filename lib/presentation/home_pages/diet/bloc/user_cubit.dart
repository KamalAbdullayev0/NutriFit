import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/domain/usecases/user/user.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/user_state.dart';
import 'package:nutri_fit/service_locator.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoading());

  Future<void> getUser() async {
    var result = await sl<GetUserDataUseCase>().call();
    result.fold(
      (l) {
        emit(UserFailure());
      },
      (data) {
        if (data != null) {
          emit(UserSuccess(user: data));
        } else {
          emit(UserFailure());
        }
      },
    );
  }
}
