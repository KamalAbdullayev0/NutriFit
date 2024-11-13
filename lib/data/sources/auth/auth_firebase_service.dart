import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutri_fit/data/models/auth/create_user_req.dart';
import 'package:nutri_fit/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);
  Future<Either> signin(SigninUserReq signinUserReq);
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
          'uid': data.user?.uid,
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
}
