import 'package:dartz/dartz.dart';
import 'package:nutri_fit/core/usecase/usecase.dart';
import 'package:nutri_fit/domain/repository/user/user.dart';
import 'package:nutri_fit/service_locator.dart';

class GetUserDataUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<UserDataRepository>().getUserData();
  }
}
