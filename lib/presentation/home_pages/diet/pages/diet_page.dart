import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/common/widgets/macro_info_widget/macro_info_widget.dart';
import 'package:nutri_fit/common/widgets/progress_indicator/progress_indicator.dart';
import 'package:nutri_fit/common/widgets/root_appbar/root_appbar.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/category_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/keto_meal_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/diet/widgets/choose_food.dart';
import 'package:nutri_fit/presentation/home_pages/diet/widgets/meals_widget.dart';

@RoutePage()
class DietPageWidget extends StatefulWidget {
  const DietPageWidget({super.key});

  @override
  State<DietPageWidget> createState() => _SportPageWidgetState();
}

class _SportPageWidgetState extends State<DietPageWidget> {
  int currentIndex = 0;
  // int _selectedIndex = 0;

  final List<Map<String, dynamic>> cards = [
    {
      'color': const Color.fromARGB(255, 217, 180, 85),
      'progress': 0.33,
      'icon': Icons.medication,
    },
    {
      'color': const Color.fromARGB(255, 72, 128, 184),
      'progress': 0.1,
      'icon': Icons.music_note,
    },
    {
      'color': const Color.fromARGB(255, 173, 105, 199),
      'progress': 0.5,
      'icon': Icons.fitness_center,
    },
  ];

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return MultiBlocProvider(
      providers: [
        BlocProvider<KetoMealCubit>(
          create: (_) => KetoMealCubit()..getKetoMeals(),
        ),
        BlocProvider(
          create: (_) => CategoryCubit()..getCategory(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const RootAppBar(
          imagePath: AppImages.ozun,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.green[300],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: SizedBox(
                  height: 210,
                  child: PageView.builder(
                    itemCount: cards.length,
                    controller: PageController(viewportFraction: 0.85),
                    onPageChanged: (index) {
                      if (currentIndex != index) {
                        setState(() {
                          currentIndex = index;
                        });
                      }
                    },
                    itemBuilder: (context, index) {
                      return Transform.scale(
                        scale: index == currentIndex ? 1.0 : 0.92,
                        child: Card(
                          color: cards[index]['color'] ?? Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    MacroInfoWidget(
                                      label: 'Protein',
                                      progress: 0.5,
                                      value: '31 / 54gr',
                                    ),
                                    MacroInfoWidget(
                                      label: 'Protein',
                                      progress: 0.4,
                                      value: '31 / 54gr',
                                    ),
                                    MacroInfoWidget(
                                      label: 'Protein',
                                      progress: 0.4,
                                      value: '31 / 54gr',
                                    ),
                                  ],
                                ),
                                SizedBox(width: 75),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ProgressIndicatorWidget(
                                      label: 'Calori',
                                      progress: '234',
                                      value: 0.6,
                                      height: 120,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pick your diet",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const ChooseFood(),
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 8, bottom: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Today's meals",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 3, 65, 115)),
                  ),
                ),
              ),
              const MealsVertical(),
            ],
          ),
        ),
      ),
    );
  }
}
