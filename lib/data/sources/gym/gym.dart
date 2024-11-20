import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:nutri_fit/data/models/gym/gym.dart';
import 'package:nutri_fit/domain/entities/gym/gym.dart';

abstract class GymRepositoryFirebaseService {
  Future<Either> getGyms();
}

class GymRepositoryFirebaseServiceImpl extends GymRepositoryFirebaseService {
  @override
  Future<Either> getGyms() async {
    try {
      print("Fetching gyms from Firestore...");
      List<GymEntity> gym = [];

      var data = await FirebaseFirestore.instance
          .collection('gym-markers')
          .orderBy('name')
          .get();

      print("Data fetched: ${data.docs.length} documents");

      if (data.docs.isNotEmpty) {
        for (var element in data.docs) {
          var gymModel = GymModel.fromJson(element.data());
          gym.add(gymModel.toEntity());
        }

        return Right(gym);
      } else {
        print("No gyms found in the database.");
        return const Left('No gyms found in the database');
      }
    } catch (e) {
      print("Error fetching gyms: $e");
      return Left('An error occurred while fetching gym data: $e');
    }
  }
}
