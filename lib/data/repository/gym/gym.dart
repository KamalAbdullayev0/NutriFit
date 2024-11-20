import 'package:dartz/dartz.dart';
import 'package:nutri_fit/data/sources/gym/gym.dart';
import 'package:nutri_fit/domain/repository/gym/gym.dart';
import 'package:nutri_fit/service_locator.dart';

class GymRepositoryImpl implements GymRepository {
  @override
  Future<Either> getGyms() async {
    return await sl<GymRepositoryFirebaseService>().getGyms();
  }
}
