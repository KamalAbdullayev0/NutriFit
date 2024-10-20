import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/common/widgets/macro_info_widget/macro_info_widget.dart';
import 'package:nutri_fit/common/widgets/progress_indicator/progress_indicator.dart';
import 'package:nutri_fit/common/widgets/root_appbar/root_appbar.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';

@RoutePage()
class DietPageWidget extends StatefulWidget {
  const DietPageWidget({super.key});

  @override
  State<DietPageWidget> createState() => _SportPageWidgetState();
}

class _SportPageWidgetState extends State<DietPageWidget> {
  int currentIndex = 0;
  int _selectedIndex = 0;

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
  final List<Map<String, dynamic>> meals = [
    {
      'color': const Color.fromARGB(255, 217, 180, 85),
      'text': 'Breakfast',
    },
    {
      'color': const Color.fromARGB(255, 72, 128, 184),
      'text': 'Lunch',
    },
    {
      'color': const Color.fromARGB(255, 173, 105, 199),
      'text': 'Dinner',
    },
    {
      'color': const Color.fromARGB(255, 49, 54, 108),
      'text': 'Snack',
    },
    {
      'color': const Color.fromARGB(255, 198, 46, 120),
      'text': 'Supper',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Today's menu",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            _buildDatePicker(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return SizedBox(
      height: 100, // Задаем высоту для контейнера
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final isSelected = index == _selectedIndex;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            child: Stack(
              children: [
                Container(
                  width:
                      100, // Задаем ширину для контейнера, чтобы избежать бесконечного размера
                  decoration: BoxDecoration(
                    color: meals[index]['color'] ?? Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        meals[index]['text'] ?? 'Default Meal',
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.white54,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
