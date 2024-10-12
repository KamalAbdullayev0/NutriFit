import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/common/widgets/macro_info_widget/macro_info_widget.dart';
import 'package:nutri_fit/common/widgets/progress_indicator/progress_indicator.dart';
import 'package:nutri_fit/common/widgets/root_appbar/root_appbar.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/diet_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    },
    {
      'color': const Color.fromARGB(255, 72, 128, 184),
    },
    {
      'color': const Color.fromARGB(255, 173, 105, 199),
    },
    {
      'color': const Color.fromARGB(255, 49, 54, 108),
    },
    {
      'color': const Color.fromARGB(255, 198, 46, 120),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RootAppBar(
        imagePath: AppImages.ozun,
      ),
      body: Column(
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
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Transform.scale(
                    scale: index == currentIndex ? 1.0 : 0.92,
                    child: Card(
                      color: cards[index]['color'],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            const SizedBox(width: 75),
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
    );
  }

  Widget planItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(icon, color: Colors.green),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Text(
        time,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Set the correct item count based on your data
        itemBuilder: (context, index) {
          final isSelected =
              index == _selectedIndex; // Check if this is the selected index

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index; // Update the selected index on tap
              });
              print("Карточка $index была нажата!");
            },
            child: Card(
              color: meals[index]['color'],
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Breakfast', // Display the title
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'sagol', // Display the subtitle
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
