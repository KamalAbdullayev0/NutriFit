import 'package:flutter/material.dart';
import 'package:nutri_fit/common/widgets/button/basic_app_button.dart';
import 'package:nutri_fit/core/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class GetStarted extends StatefulWidget {
  final PageController _controller = PageController();
  GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              children: [
                const SizedBox(height: 180),
                const Text(
                  'NutriFit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Healthy life with NutriFit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                // PageView и индикатор
                Container(
                  height: 100,
                  width: 100,
                  child: PageView(
                    controller: widget
                        ._controller, // Здесь исправлено на widget._controller
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          child: const Center(child: Text('Page 1'))),
                      Container(child: const Center(child: Text('Page 1'))),
                      SizedBox(
                          child: Container(
                              child: const Center(child: Text('Page 1')))),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SmoothPageIndicator(
                  controller: widget._controller, // Здесь тоже исправлено
                  count: 3,
                  effect: const WormEffect(
                    dotHeight: 15,
                    dotWidth: 15,
                    activeDotColor: Colors.white,
                    dotColor: Colors.white54,
                  ),
                ),
                const SizedBox(height: 16),
                // const Text(
                //   'Active Life',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 10,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const Text(
                //   'Join our family to discover diet lists and exercise types',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 10,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                const SizedBox(height: 16),
                // Кнопки SIGN IN и LOGIN
                BasicAppButton(
                  onPressed: () {},
                  title: 'SIGN IN',
                  height: 65,
                  backgroundColor: AppColors.green,
                ),
                const SizedBox(height: 21),
                BasicAppButton(
                  onPressed: () {},
                  title: 'LOGIN',
                  height: 65,
                  backgroundColor: AppColors.green,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
