import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nutri_fit/domain/entities/gym/gym.dart';
import 'package:nutri_fit/presentation/home_pages/location/bloc/location_bloc_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/location/bloc/location_state.dart';

class GymInfoWidget extends StatelessWidget {
  final GymEntity selectedGym;
  const GymInfoWidget({
    super.key,
    required this.selectedGym,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10, // Расстояние от нижней части карты
      left: MediaQuery.of(context).size.width * 0.04, // Отступ слева
      right: MediaQuery.of(context).size.width * 0.04, // Отступ справа
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    selectedGym.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    selectedGym.category,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                selectedGym.description,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.phone, size: 18, color: Colors.grey),
                  const SizedBox(width: 8.0),
                  Text(selectedGym.phone),
                  Spacer(),
                  Text(
                    selectedGym.workingHours.length > 12
                        ? selectedGym.workingHours
                            .substring(selectedGym.workingHours.length - 12)
                        : selectedGym.workingHours,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      final state = context.read<LocationCubit>().state;
                      if (state is LocationSuccess &&
                          state.selectedGym != null) {
                        final selectedGym = state.selectedGym!;
                        context.read<LocationCubit>().buildRoute(
                              LatLng(selectedGym.latitude as double,
                                  selectedGym.longitude as double),
                            );
                      }
                    },
                    icon: const Icon(Icons.directions),
                    label: Text("get directions",
                        style:
                            TextStyle(fontSize: 16, color: Colors.grey[100])),
                    style: ElevatedButton.styleFrom(
                      iconColor: Colors.grey[100],
                      backgroundColor: Colors.green[300],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed:
                        context.read<LocationCubit>().state is LocationSuccess
                            ? () {
                                context.read<LocationCubit>().selectGym(null);
                              }
                            : null,
                    icon: const Icon(Icons.cancel),
                    label: Text("Close",
                        style: TextStyle(fontSize: 16, color: Colors.red[300])),
                    style: ElevatedButton.styleFrom(
                      iconColor: Colors.red,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
