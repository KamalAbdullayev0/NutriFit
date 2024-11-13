import 'package:dartz/dartz.dart';

abstract class UserDataRepository {
  Future<Either> getUserData();
}
