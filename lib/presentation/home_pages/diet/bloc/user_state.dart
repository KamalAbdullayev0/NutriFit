import 'package:nutri_fit/domain/entities/user/user.dart';

abstract class UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserInfoEntity user;

  UserSuccess({required this.user});
}

class UserFailure extends UserState {}
