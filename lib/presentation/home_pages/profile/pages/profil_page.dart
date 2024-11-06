import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:nutri_fit/common/widgets/macro_info_widget/macro_info_widget.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';

@RoutePage()
class ProfilePageWidget extends StatelessWidget {
  const ProfilePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              const SizedBox(height: 20),
              _buildProfileHeader(),
              const SizedBox(height: 20),
              _buildSummaryCard(),
              const SizedBox(height: 20),
              _buildActivitySection(),
              const SizedBox(height: 20),
              _buildMacroSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(AppImages.ozun),
        ),
        const SizedBox(height: 16),
        const Text(
          'Kamal',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'abdullayevkamal16.08@gmail.com',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
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
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MacroInfoWidget(
                label: 'Protein',
                progress: 0.4,
                value: '31/82g',
              ),
              const MacroInfoWidget(
                label: 'Fat',
                progress: 0.8,
                value: '43/54g',
              ),
              const MacroInfoWidget(
                label: 'Carbs',
                progress: 0.6,
                value: '150/250g',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalorieInfo(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildCircularIndicator(double progress, String value, String label) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 6,
                backgroundColor: Colors.white24,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Colors.greenAccent),
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _buildActivitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recent Activities",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildActivityTile(Icons.run_circle, 'Running', '5.2 km'),
            _buildActivityTile(Icons.fitness_center, 'Workout', '45 min'),
            _buildActivityTile(Icons.pool, 'Swimming', '30 laps'),
          ],
        ),
      ],
    );
  }

  Widget _buildActivityTile(IconData icon, String activity, String stat) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.lightBlue,
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          activity,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          stat,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildMacroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Nutritional Breakdown",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 0),
        const SizedBox(height: 16),
        const Divider(color: Colors.grey),
        const SizedBox(height: 16),
        _buildDetailedNutrientSection(),
      ],
    );
  }

  Widget _buildDetailedNutrientSection() {
    return Column(
      children: [
        _buildNutrientRow("Protein", "12g", 0.6, Colors.green),
        const SizedBox(height: 12),
        _buildNutrientRow("Carbohydrate", "25g", 0.8, Colors.orange),
        const SizedBox(height: 12),
        _buildNutrientRow("Fat", "180mg", 0.4, Colors.red),
        const SizedBox(height: 12),
        _buildNutrientRow(
            "Total calories", "1,500 kCal", 0.7, Colors.blueAccent),
      ],
    );
  }

  Widget _buildNutrientRow(
      String nutrient, String value, double progress, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          nutrient,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              height: 10,
              width: 100,
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                color: color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
