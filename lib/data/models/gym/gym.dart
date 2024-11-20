import 'package:nutri_fit/domain/entities/gym/gym.dart';

class GymModel {
  String? name;
  String? category;
  String? description;
  String? email;
  num? latitude; // Latitude as a single field
  num? longitude; // Longitude as a single field
  String? phone;
  String? workingHours;

  GymModel({
    required this.name,
    required this.category,
    required this.description,
    required this.email,
    required this.latitude,
    required this.longitude,
    required this.phone,
    required this.workingHours,
  });

  // Constructor to create the model from Firebase JSON data
  GymModel.fromJson(Map<String, dynamic> data) {
    name = data['name'];
    category = data['category'];
    description = data['description'];
    email = data['email'];
    latitude = data['latitude']; // Parsing latitude
    longitude = data['longitude']; // Parsing longitude
    phone = data['phone'];
    workingHours = data['working_hours'];
  }

  // Convert the model into an entity for use in the app's domain layer
  GymEntity toEntity() {
    return GymEntity(
      name: name!,
      category: category!,
      description: description!,
      email: email!,
      latitude: latitude!,
      longitude: longitude!,
      phone: phone!,
      workingHours: workingHours!,
    );
  }
}
