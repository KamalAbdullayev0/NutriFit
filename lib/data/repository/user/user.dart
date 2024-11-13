import 'package:dartz/dartz.dart';
import 'package:nutri_fit/data/sources/user/user.dart';
import 'package:nutri_fit/domain/repository/user/user.dart';
import 'package:nutri_fit/service_locator.dart';

class UserDataRepositoryImpl implements UserDataRepository {
  @override
  Future<Either> getUserData() async{
    return await sl<UserDataRepositoryFirebaseService>().getUserData();
  }
}
