import 'package:dartz/dartz.dart';

import 'package:nutri_fit/data/models/auth/create_user_req.dart';
import 'package:nutri_fit/data/models/auth/signin_user_req.dart';
import 'package:nutri_fit/data/sources/auth_firebase_service.dart';
import 'package:nutri_fit/domain/repository/auth/auth.dart';
import 'package:nutri_fit/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }
}
