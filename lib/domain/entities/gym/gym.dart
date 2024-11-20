class GymEntity {
  final String name;
  final String category;
  final String description;
  final String email;
  final num latitude; // Latitude as a single field
  final num longitude; // Longitude as a single field
  final String phone;
  final String workingHours;

  GymEntity({
    required this.name,
    required this.category,
    required this.description,
    required this.email,
    required this.latitude,
    required this.longitude,
    required this.phone,
    required this.workingHours,
  });
}
