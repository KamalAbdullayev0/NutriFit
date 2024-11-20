import 'package:dartz/dartz.dart';
import 'package:nutri_fit/core/usecase/usecase.dart';
import 'package:nutri_fit/domain/repository/gym/gym.dart';
import 'package:nutri_fit/service_locator.dart';

class GetGymUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<GymRepository>().getGyms();
  }
}
