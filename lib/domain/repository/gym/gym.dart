import 'package:dartz/dartz.dart';

abstract class GymRepository {
  Future<Either> getGyms();
}
