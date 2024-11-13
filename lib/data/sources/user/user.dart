import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutri_fit/data/models/user/user.dart';
import 'package:nutri_fit/domain/entities/user/user.dart';

abstract class UserDataRepositoryFirebaseService {
  Future<Either> getUserData();
}

class UserDataRepositoryFirebaseServiceImpl
    extends UserDataRepositoryFirebaseService {
  @override
  Future<Either> getUserData() async {
    try {
      FirebaseFirestore firbaseFirestore = FirebaseFirestore.instance;
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      var userAuth = firebaseAuth.currentUser;
      if (userAuth == null) {
        return const Left('User not logged in');
      }

      String uId = userAuth.uid;

      var user = await firbaseFirestore.collection('Users').doc(uId).get();

      if (user.exists) {
        UserInfoModel userModel = UserInfoModel.fromJson(user.data()!);
        UserInfoEntity userEntity = userModel.toEntity();
        return Right(userEntity);
      } else {
        return const Left('User document does not exist');
      }
    } catch (e) {
      return const Left('An error occurred while getting user data');
    }
  }
}
