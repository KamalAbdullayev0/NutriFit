import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutri_fit/core/configs/constants/app_urls.dart';

import 'package:nutri_fit/data/models/auth/create_user_req.dart';
import 'package:nutri_fit/data/models/auth/signin_user_req.dart';
import 'package:nutri_fit/data/models/auth/user.dart';
import 'package:nutri_fit/domain/entities/auth/user.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
  Future<Either> getUser();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );
      print(
          'User signed in: ${signinUserReq.email}'); // Принт для проверки успешного входа
      return const Right('Signin successful');
    } on FirebaseException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'No user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user.';
      }
      print('Signin error: $message'); // Принт для проверки ошибок входа
      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );

      print(
          'User signed up: ${data.user?.email}'); // Принт для проверки успешной регистрации
      // Проверяем, был ли создан UID
      if (data.user != null) {
        print(
            'User UID: ${data.user?.uid}'); // Принт для проверки UID пользователя

        await FirebaseFirestore.instance
            .collection('Users')
            .doc(data.user?.uid)
            .set({
          'name': createUserReq.fullName,
          'email': data.user?.email,
        });

        print(
            'User data written to Firestore: ${data.user?.uid}'); // Принт для проверки записи в Firestore
      }

      return const Right('Signup successful');
    } on FirebaseException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      } else {
        message = 'An error occurred while signing up.';
      }
      print('Signup error: $message'); // Принт для проверки ошибок регистрации
      return Left(message);
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firbaseFirestore = FirebaseFirestore.instance;

      var user = await firbaseFirestore
          .collection('Users')
          .doc(firebaseAuth.currentUser?.uid)
          .get();

      UserModel userModel = UserModel.fromJson(user.data()!);
      userModel.imageURL =
          firebaseAuth.currentUser?.photoURL ?? AppUrls.defaultImage;
      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    } catch (e) {
      return const Left('An error occurred while getting user data');
    }
  }
}
