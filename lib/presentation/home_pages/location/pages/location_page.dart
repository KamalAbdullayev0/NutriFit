import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nutri_fit/common/widgets/root_appbar/root_appbar.dart';
import 'package:nutri_fit/domain/entities/gym/gym.dart';
import 'package:nutri_fit/presentation/home_pages/location/bloc/location_bloc_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/location/bloc/location_state.dart';
import 'package:nutri_fit/presentation/home_pages/location/widgets/get_info_widget.dart';

@RoutePage()
class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = GetIt.I<LocationCubit>();
        cubit.initializeLocation();
        cubit.getGyms();
        return cubit;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: RootAppBar(),
        body: BlocBuilder<LocationCubit, LocationState>(
          builder: (context, state) {
            if (state is LocationInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              ); // Initial loading state
            }
            if (state is LocationSuccess) {
              final LatLng initialPosition =
                  state.currentLocation ?? LatLng(0, 0);
              final GymEntity? selectedGym = state.selectedGym;
              Set<Marker> markers = {};
              for (var gym in state.gym) {
                markers.add(Marker(
                  markerId: MarkerId("${gym.latitude}-${gym.longitude}"),
                  position:
                      LatLng(gym.latitude as double, gym.longitude as double),
                  infoWindow: InfoWindow(title: gym.name),
                  onTap: () => context.read<LocationCubit>().selectGym(gym),
                ));
              }
              return Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(45),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.92,
                              height: MediaQuery.of(context).size.height * 0.66,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: initialPosition,
                                    zoom: 14,
                                  ),
                                  markers: markers,
                                  myLocationEnabled: true,
                                  compassEnabled: true,
                                  mapToolbarEnabled: false,
                                  myLocationButtonEnabled: false,
                                  zoomControlsEnabled: false,
                                  polylines: (state is LocationSuccess &&
                                          state.routeCoordinates != null)
                                      ? {
                                          Polyline(
                                            polylineId: PolylineId("route"),
                                            color: Colors.blue,
                                            width: 5,
                                            points: state.routeCoordinates!,
                                          ),
                                        }
                                      : {},
                                  onMapCreated:
                                      (GoogleMapController controller) {},
                                ),
                              ),
                            ),
                          ),
                          if (selectedGym != null)
                            GymInfoWidget(
                              selectedGym: selectedGym,
                            ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.green[300], // Яркий зелёный цвет
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0, // Вертикальный отступ
                            horizontal: 30.0, // Горизонтальный отступ
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15.0), // Закруглённые углы
                          ),
                          elevation: 8, // Высота кнопки
                          shadowColor: Colors.green.shade200, // Цвет тени
                        ),
                        onPressed: () {
                          _showCategoryPicker(
                              context); // Открыть модальное окно
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Choose a category", // Выбор категории
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              size: 30.0,
                              Icons.arrow_drop_down_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }
            if (state is LocationFailure) {
              return const Center(
                child: Text(
                  "Не удалось загрузить данные о местоположении.",
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return const Center(
              child: Text("Данные недоступны"),
            );
          },
        ),
      ),
    );
  }

  void _showCategoryPicker(BuildContext context) {
    final categories = [
      {"name": "Premium", "emoji": "✨"},
      {"name": "Standard", "emoji": "🌟"},
      {"name": "Economy", "emoji": "💰"}
    ];

    // Получаем текущее состояние LocationCubit
    final state = BlocProvider.of<LocationCubit>(context).state;

    int gymCount = 0;
    if (state is LocationSuccess) {
      gymCount = state.gym.length;
    }
    final currentDate = DateTime.now();
    final formattedDate =
        "${currentDate.day}.${currentDate.month}.${currentDate.year}";

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext modalContext) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(25.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Choose a category",
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              ListView.separated(
                shrinkWrap: true,
                itemCount: categories.length,
                separatorBuilder: (_, __) =>
                    Divider(color: Colors.grey.shade300),
                itemBuilder: (BuildContext modalContext, int index) {
                  final category = categories[index];
                  return ListTile(
                    leading: Text(
                      category["emoji"]!,
                      style: const TextStyle(fontSize: 24.0),
                    ),
                    title: Text(
                      category["name"]!,
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      BlocProvider.of<LocationCubit>(context)
                          .getGymsByCategory(category["name"]!);
                      Navigator.pop(modalContext);
                    },
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      "Date: $formattedDate",
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Total Gyms: $gymCount",
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
