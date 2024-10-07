import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/presentation/home_pages/sport/bloc/sport_bloc.dart';

@RoutePage()
class SportPageWidget extends StatefulWidget {
  const SportPageWidget({super.key});

  @override
  State<SportPageWidget> createState() => _SportPageWidgetState();
}

class _SportPageWidgetState extends State<SportPageWidget> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> cards = [
    {
      'color': Colors.yellow[700],
      'number': 'Take the medicine',
      'type': '3 times a day',
      'progress': 0.33,
      'icon': Icons.medication,
    },
    {
      'color': Colors.blue[700],
      'number': 'Music lessons',
      'type': 'Every Monday',
      'progress': 0.1,
      'icon': Icons.music_note,
    },
    {
      'color': Colors.green[700],
      'number': 'Exercise',
      'type': '1 hour daily',
      'progress': 0.5,
      'icon': Icons.fitness_center,
    },
    {
      'color': Colors.red[700],
      'number': 'Drink water',
      'type': '8 glasses daily',
      'progress': null,
      'icon': Icons.local_drink,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit()..loadTasks(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'HI! Insanin adi',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              CircleAvatar(
                backgroundImage: AssetImage(AppImages.ozun),
              ),
            ],
          ),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        Colors.white.withOpacity(0.3),
                                    child: Icon(
                                      cards[index]['icon'],
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      cards[index]['number'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.orange[300],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                cards[index]['type'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: cards[index]['progress'] ?? 0.0,
                                      backgroundColor:
                                          Colors.white.withOpacity(0.3),
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              Colors.white),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${((cards[index]['progress'] ?? 0) * 100).toInt()}%',
                                    style: const TextStyle(color: Colors.white),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
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
