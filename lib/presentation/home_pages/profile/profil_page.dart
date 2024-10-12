import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/common/widgets/macro_info_widget/macro_info_widget.dart';

@RoutePage()
class ProfilPageWidget extends StatelessWidget {
  const ProfilPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 6),
            _buildSummaryCard(),
            SizedBox(height: 16),
            _buildMealGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCalorieInfo('1,138', 'Eaten'),
              _buildCircularIndicator(0.6, '884', 'Remaining'),
              _buildCalorieInfo('345', 'Burned'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MacroInfoWidget(
                label: 'Protein',
                progress: 0.4,
                value: '31/82g',
              ),
              _buildMacroInfo('Protein', 0.4, '31 / 82 g'),
              _buildMacroInfo('Fat', 0.8, '43 / 54 g'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularIndicator(double value, String amount, String label) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            value: value,
            backgroundColor: Colors.white24,
            color: Colors.white,
            strokeWidth: 6,
          ),
        ),
        SizedBox(height: 8),
        Text(
          amount,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildCalorieInfo(String amount, String label) {
    return Column(
      children: [
        Text(
          amount,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildMacroInfo(String label, double progress, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.white)),
        SizedBox(height: 4),
        Container(
          width: 80,
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white24,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 4),
        Text(value, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildMealGrid() {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.2,
        children: [
          _buildMealCard('Breakfast', 'https://via.placeholder.com/150'),
          _buildMealCard('Lunch', 'https://via.placeholder.com/150'),
          _buildMealCard('Dinner', 'https://via.placeholder.com/150'),
          _buildAddMealCard(),
        ],
      ),
    );
  }

  Widget _buildMealCard(String label, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildAddMealCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: Center(
        child: Icon(Icons.add, size: 40, color: Colors.grey[600]),
      ),
    );
  }
}
