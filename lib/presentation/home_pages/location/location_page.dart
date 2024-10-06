import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class LocationPageWidget extends StatefulWidget {
  @override
  _LocationPageWidgetState createState() => _LocationPageWidgetState();
}

class _LocationPageWidgetState extends State<LocationPageWidget> {
  int currentIndex = 0; // Keeps track of the current card index

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
      'progress': null, // Simulating a null progress value
      'icon': Icons.local_drink,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100], // Background color to match the image
      appBar: AppBar(
        title: Text('Task Progress'),
        backgroundColor: Colors.green[200],
        elevation: 0, // Flat app bar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 210,
            width: double.infinity,
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
                  scale: index == currentIndex
                      ? 1.0
                      : 0.92, // scale the current card
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
                                backgroundColor: Colors.white.withOpacity(0.3),
                                child: Icon(cards[index]['icon'],
                                    color: Colors.white),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  cards[index]['number'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Icon(Icons.check_circle,
                                  color: Colors.orange[300]), // Checkmark icon
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            cards[index]['type'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: cards[index]['progress'] ??
                                      0.0, // Check for null value
                                  backgroundColor:
                                      Colors.white.withOpacity(0.3),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                '${((cards[index]['progress'] ?? 0) * 100).toInt()}%', // Handle null
                                style: TextStyle(color: Colors.white),
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
        ],
      ),
    );
  }
}
