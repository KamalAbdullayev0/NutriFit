import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:intl/intl.dart';
import 'package:nutri_fit/common/widgets/progress_indicator/progress_indicator.dart';
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
            const SizedBox(height: 16.0),
            _buildDatePicker(context),
            const SizedBox(height: 16.0),
            _buildSummaryCard(),
            const SizedBox(height: 16.0),
            // _buildDailyFoodSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    final now = DateTime.now();
    final dateFormatter = DateFormat('MMM');

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          final date =
              now.add(Duration(days: index)).subtract(const Duration(days: 3));
          final isSelected = index == 3;
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
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
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
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
              _buildCalorieInfo('2875 kcal', 'Remaining'),
            ],
          ),
          const SizedBox(height: 16.0),
          const Row(
            children: [
              Expanded(
                  child: ProgressIndicatorWidget(
                label: 'Protein',
                value: 0.3,
                progress: '30%',
              )),
              SizedBox(width: 16.0),
              Expanded(
                  child: ProgressIndicatorWidget(
                label: 'Carbs',
                value: 0.5,
                progress: '50%',
              )),
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
        Text(amount, style: const TextStyle(color: Colors.white, fontSize: 18)),
        Text(label, style: const TextStyle(color: Colors.white54)),
      ],
    );
  }

  // Widget _buildDailyFoodSection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Text(
  //           'Daily Food',
  //           style: TextStyle(color: Colors.white, fontSize: 18),
  //         ),
  //       ),
  //       SizedBox(
  //         height: 100,
  //         child: ListView.builder(
  //           scrollDirection: Axis.horizontal,
  //           itemCount: 4,
  //           itemBuilder: (context, index) {
  //             return _buildFoodImage('https://via.placeholder.com/150');
  //           },
  //         ),
  //       ),
  //       _buildAskAIButton(),
  //     ],
  //   );
  // }

  // Widget _buildFoodImage(String imageUrl) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(8.0),
  //       child: Image.network(
  //         imageUrl,
  //         width: 100,
  //         height: 100,
  //         fit: BoxFit.cover,
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildAskAIButton() {
  //   return Container(
  //     margin: EdgeInsets.all(16.0),
  //     padding: EdgeInsets.all(16.0),
  //     decoration: BoxDecoration(
  //       color: Colors.greenAccent,
  //       borderRadius: BorderRadius.circular(8.0),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           'Ask AI',
  //           style: TextStyle(color: Colors.black, fontSize: 16),
  //         ),
  //         Icon(Icons.camera_alt, color: Colors.black),
  //       ],
  //     ),
  //   );
  // }
}
