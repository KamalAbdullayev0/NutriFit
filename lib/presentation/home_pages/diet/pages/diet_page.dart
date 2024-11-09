import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/common/widgets/macro_info_widget/macro_info_widget.dart';
import 'package:nutri_fit/common/widgets/progress_indicator/progress_indicator.dart';
import 'package:nutri_fit/common/widgets/root_appbar/root_appbar.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/domain/entities/category/category.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/category_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/category_state.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/keto_meal_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/keto_meal_state.dart';
import 'package:nutri_fit/presentation/home_pages/diet/widgets/pick_your_diet.dart';

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
      'number': 'Take the medicine',
      'type': '3 times a day',
      'progress': 0.33,
      'icon': Icons.medication,
    },
    {
      'color': const Color.fromARGB(255, 72, 128, 184),
      'number': 'Music lessons',
      'type': 'Every Monday',
      'progress': 0.1,
      'icon': Icons.music_note,
    },
    {
      'color': const Color.fromARGB(255, 173, 105, 199),
      'number': 'Exercise',
      'type': '1 hour daily',
      'progress': 0.5,
      'icon': Icons.fitness_center,
    },
  ];

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return MultiBlocProvider(
      providers: [
        // BlocProvider<KetoMealCubit>(
        //   create: (_) => KetoMealCubit()..getKetoMeals(),
        // ),
        BlocProvider(
          create: (_) => CategoryCubit()..getCategory(),
        ),
      ],
      child: Scaffold(
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
                                      progress: 0.4,
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
                                      value: 0.4,
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
              ChooseFood(),

              // PickYourDiet(),
              // _buildAllMeals(context),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildPickYourDiet(List<CategoryEntity> category) {
  //   return SizedBox(
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: category.length,
  //       itemBuilder: (context, index) {
  //         return Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
  //           child: Stack(
  //             children: [
  //               Container(
  //                 width: 100,
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.black.withOpacity(0.05),
  //                       spreadRadius: 1,
  //                       blurRadius: 10,
  //                       offset: const Offset(0, 4),
  //                     ),
  //                   ],
  //                   border: Border.all(color: Colors.black.withOpacity(0.15)),
  //                   borderRadius: BorderRadius.circular(20),
  //                 ),
  //                 clipBehavior: Clip.hardEdge,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       category[index].categroyEmoji,
  //                       style: TextStyle(
  //                         fontSize: 36,
  //                         fontWeight: FontWeight.w500,
  //                       ),
  //                     ),
  //                     SizedBox(height: 5),
  //                     Text(
  //                       category[index].categoryName,
  //                       style: TextStyle(
  //                         fontSize: 16,
  //                         fontWeight: FontWeight.w500,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               // Positioned.fill(
  //               //   child: Material(
  //               //     color: Colors.transparent,
  //               //     child: InkWell(
  //               //       borderRadius: BorderRadius.circular(10),
  //               //       onTap: () {
  //               //         // setState(() {
  //               //         //   _selectedIndex = index;
  //               //         // });
  //               //       },
  //               //     ),
  //               //   ),
  //               // ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget _buildAllMeals(BuildContext context) {
  //   return SizedBox(
  //     height: 2000,
  //     child: SizedBox(
  //       child: ListView.builder(
  //         shrinkWrap: true,
  //         physics: const NeverScrollableScrollPhysics(),
  //         scrollDirection: Axis.vertical,
  //         itemCount: meals.length,
  //         itemBuilder: (context, index) {
  //           return Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
  //             child: Container(
  //               width: double.infinity,
  //               height: 400,
  //               color: const Color.fromARGB(
  //                   249, 250, 251, 255), //rgba(249,250,251,255)
  //               child: Column(
  //                 children: [
  //                   Padding(
  //                     padding:
  //                         const EdgeInsets.only(left: 16, top: 16, right: 16),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Row(
  //                           children: [
  //                             Text(
  //                               meals[index]['emoji'] ?? '🍴',
  //                               style: TextStyle(
  //                                 fontSize: 36,
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               width: 10,
  //                             ),
  //                             Text(
  //                               meals[index]['text'] ?? 'Default Meal',
  //                               style: TextStyle(
  //                                 color: Colors.black,
  //                                 fontSize: 20,
  //                                 fontWeight: FontWeight.w500,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         Text(
  //                           'More',
  //                           style: TextStyle(
  //                             color: Colors.blue,
  //                             fontSize: 20,
  //                             fontWeight: FontWeight.w500,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.all(10),
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             _MealsVertical(context),
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Widget _MealsVertical(BuildContext context) {
  //   return SizedBox(
  //     height: 300, // Задаем высоту для контейнера
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: meals.length,
  //       itemBuilder: (context, index) {
  //         final isSelected = index == _selectedIndex;
  //         return Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
  //           child: Stack(
  //             children: [
  //               Container(
  //                 width: 240,
  //                 decoration: BoxDecoration(
  //                   color: meals[index]['color'] ?? Colors.white,
  //                   boxShadow: [
  //                     BoxShadow(
  //                       color: Colors.black.withOpacity(0.05),
  //                       spreadRadius: 0,
  //                       blurRadius: 10,
  //                       offset: const Offset(1, 1),
  //                     ),
  //                   ],
  //                   border: Border.all(color: Colors.black.withOpacity(0.08)),
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //                 clipBehavior: Clip.hardEdge,
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     meals[index]['images'] != null
  //                         ? Image.asset(
  //                             meals[index]['images'],
  //                             width: 240,
  //                             height: 240,
  //                             fit: BoxFit.cover,
  //                           )
  //                         : Container(),
  //                     Container(
  //                       width: 240,
  //                       height: 58,
  //                       color: Colors.white,
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Text(
  //                             meals[index]['yemek_adi'] ?? 'Default Meal',
  //                             style: TextStyle(
  //                               color: Colors.black,
  //                               fontSize: 20,
  //                               fontWeight: FontWeight.w500,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),

  //                     // Text(
  //                     //   meals[index]['emoji'] ?? '🍴',
  //                     //   style: TextStyle(
  //                     //     fontSize: 36,
  //                     //     fontWeight: FontWeight.w500,
  //                     //   ),
  //                     // ),
  //                     // SizedBox(height: 5),
  //                     // Text(
  //                     //   meals[index]['text'] ?? AppImages.sekil1,
  //                     //   style: TextStyle(
  //                     //     color: isSelected ? Colors.red : Colors.black,
  //                     //     fontSize: 16,
  //                     //     fontWeight: FontWeight.w500,
  //                     //   ),
  //                     // ),
  //                   ],
  //                 ),
  //               ),
  //               // Positioned.fill(
  //               //   child: Material(
  //               //     color: Colors.transparent,
  //               //     child: InkWell(
  //               //       borderRadius: BorderRadius.circular(10),
  //               //       onTap: () {
  //               //         setState(() {
  //               //           _selectedIndex = index;
  //               //         });
  //               //       },
  //               //     ),
  //               //   ),
  //               // ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
