import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nutri_fit/domain/entities/gym/gym.dart';
import 'package:nutri_fit/domain/usecases/gym/gym.dart';
import 'package:nutri_fit/presentation/home_pages/location/bloc/location_state.dart';
import 'package:nutri_fit/service_locator.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());

  Future<void> initializeLocation() async {
    try {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        final requestedPermission = await Geolocator.requestPermission();
        if (requestedPermission == LocationPermission.deniedForever ||
            requestedPermission == LocationPermission.denied) {
          emit(LocationFailure());
          return;
        }
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      emit(LocationSuccess(
        currentLocation: LatLng(position.latitude, position.longitude),
        gym: [],
      ));
    } catch (e) {
      emit(LocationFailure());
    }
  }

  Future<void> getGyms() async {
    try {
      final result = await sl<GetGymUseCase>().call();
      result.fold(
        (error) => emit(LocationFailure()),
        (data) => emit(LocationSuccess(
          currentLocation: state is LocationSuccess
              ? (state as LocationSuccess).currentLocation
              : null,
          gym: data,
        )),
      );
    } catch (e) {
      emit(LocationFailure());
    }
  }

  void selectGym(GymEntity? gym) {
    if (state is LocationSuccess) {
      final currentState = state as LocationSuccess;
      if (gym != null) {
        emit(currentState.copyWith(selectedGym: gym));
      } else {
        emit(currentState.copyWith2());
      }
    }
  }

  void getGymsByCategory(String category) async {
    if (state is LocationSuccess) {
      try {
        final result = await sl<GetGymUseCase>().call();
        result.fold(
          (error) => emit(LocationFailure()),
          (data) {
            final filteredGyms =
                data.where((gym) => gym.category == category).toList();
            final currentState = state as LocationSuccess;

            emit(currentState.copyWith(gym: filteredGyms));
          },
        );
      } catch (e) {
        emit(LocationFailure());
      }
    }
  }

  Future<void> buildRoute(LatLng destination) async {
    if (state is LocationSuccess) {
      final currentState = state as LocationSuccess;
      final LatLng origin = currentState.currentLocation!;

      try {
        const String apiKey =
            "AIzaSyBC6z-mLQSjaCZLcXgYx54fMUgZYBXE-AA"; // Replace with your API key
        final PolylinePoints polylinePoints = PolylinePoints();

        // Get route points
        final PolylineResult result =
            await polylinePoints.getRouteBetweenCoordinates(
          googleApiKey: apiKey, // Named parameter for the API key
          request: PolylineRequest(
            origin: PointLatLng(origin.latitude, origin.longitude),
            destination:
                PointLatLng(destination.latitude, destination.longitude),
            mode: TravelMode.driving,
          ),
        );

        if (result.points.isNotEmpty) {
          final List<LatLng> polylineCoordinates = result.points
              .map((point) => LatLng(point.latitude, point.longitude))
              .toList();

          emit(currentState.copyWith(routeCoordinates: polylineCoordinates));
        } else {
          emit(LocationFailure());
        }
      } catch (e) {
        emit(LocationFailure());
      }
    }
  }
}
