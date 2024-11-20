import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nutri_fit/domain/entities/gym/gym.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationSuccess extends LocationState {
  final List<GymEntity> gym;
  final LatLng? currentLocation;
  final GymEntity? selectedGym;
   final List<LatLng>? routeCoordinates;

  LocationSuccess({
    required this.gym,
    this.currentLocation,
    this.selectedGym,
    this.routeCoordinates,
  });

  LocationSuccess copyWith({
    List<LatLng>? routeCoordinates,
    List<GymEntity>? gym,
    LatLng? currentLocation,
    GymEntity? selectedGym,
  }) {
    return LocationSuccess(
      gym: gym ?? this.gym,
      currentLocation: currentLocation ?? this.currentLocation,
      selectedGym: selectedGym ?? this.selectedGym,
      routeCoordinates: routeCoordinates ?? this.routeCoordinates,
    );
  }

  LocationSuccess copyWith2({
    List<GymEntity>? gym,
    LatLng? currentLocation,
    
  }) {
    return LocationSuccess(
      gym: gym ?? this.gym,
      currentLocation: currentLocation ?? this.currentLocation,
    );
  }
}

class LocationFailure extends LocationState {}
