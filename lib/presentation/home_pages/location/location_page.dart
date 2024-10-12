import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart';
import 'package:nutri_fit/common/widgets/root_appbar/root_appbar.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/core/configs/theme/app_colors.dart';

@RoutePage()
class LocationPageWidget extends StatelessWidget {
  const LocationPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const RootAppBar(imagePath: AppImages.ozun),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.0),
            _buildDatePicker(context),
            // SizedBox(height: 16.0),
            // _buildSummaryCard(),
            // SizedBox(height: 16.0),
            // _buildDailyFoodSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    final now = DateTime.now();
    final dateFormatter = DateFormat('MMM');

    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          final date =
              now.add(Duration(days: index)).subtract(Duration(days: 3));

          final isSelected = index == 3;
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                color: isSelected ? Colors.greenAccent : Colors.grey[800],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('d').format(date), // Отображаем день месяца
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    dateFormatter.format(date), // Отображаем месяц
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCalorieInfo('1456 kcal', 'Consumed'),
              CircularProgressIndicator(
                value: 0.5, // Adjust this value dynamically
                backgroundColor: Colors.black,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
              ),
              _buildCalorieInfo('2875 kcal', 'Remaining'),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                  child: _buildProgressIndicator('Sleep', 0.6, '5/8 Hours')),
              SizedBox(width: 16.0),
              Expanded(
                  child: _buildProgressIndicator('Water', 0.6, '3/5 Liters')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalorieInfo(String amount, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(amount, style: TextStyle(color: Colors.white, fontSize: 18)),
        Text(label, style: TextStyle(color: Colors.white54)),
      ],
    );
  }

  Widget _buildProgressIndicator(String label, double value, String progress) {
    return Column(
      children: [
        CircularProgressIndicator(
          value: value,
          backgroundColor: Colors.black,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
        ),
        SizedBox(height: 8.0),
        Text(label, style: TextStyle(color: Colors.white)),
        Text(progress, style: TextStyle(color: Colors.white54)),
      ],
    );
  }

  Widget _buildDailyFoodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Daily Food',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return _buildFoodImage('https://via.placeholder.com/150');
            },
          ),
        ),
        _buildAskAIButton(),
      ],
    );
  }

  Widget _buildFoodImage(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildAskAIButton() {
    return Container(
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Ask AI',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Icon(Icons.camera_alt, color: Colors.black),
        ],
      ),
    );
  }
}
