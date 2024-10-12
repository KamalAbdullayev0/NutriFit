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
    return BlocProvider(
      create: (context) => TaskCubit()..loadTasks(),
      child: Scaffold(
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
                  "Today's plan",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  planItem(
                    icon: Icons.local_laundry_service,
                    title: 'Wash yesterday\'s clothes',
                    subtitle: 'The whole life should wash',
                    time: 'Just now',
                  ),
                  planItem(
                    icon: Icons.book,
                    title: 'Read a design journal',
                    subtitle: 'Be the best designer',
                    time: '3 h later',
                  ),
                  planItem(
                    icon: Icons.account_balance,
                    title: 'Go to the bank',
                    subtitle: 'Take out the design fee',
                    time: '3 h later',
                  ),
                  planItem(
                    icon: Icons.sports_basketball,
                    title: 'Post a work on Dribbble',
                    subtitle: 'Hope to be recognized',
                    time: '7 h later',
                  ),
                ],
              ),
            ),
          ],
        ),
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
}
