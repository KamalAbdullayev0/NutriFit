import 'package:flutter/material.dart';
import 'package:nutri_fit/common/widgets/button/basic_app_button.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/core/configs/theme/app_colors.dart';

import 'package:nutri_fit/presentation/router/router.gr.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class GetStartedScreen extends StatefulWidget {
  final PageController _controller = PageController();

  GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 160,
                    width: 160,
                    child: Image.asset(
                      AppImages.logo,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImages.yazi,
                    height: 60,
                    width: 300,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),

                const Spacer(),
                // PageView и индикатор
                SizedBox(
                  height: 200,
                  width: 250,
                  child: PageView(
                    controller: widget
                        ._controller, // Здесь исправлено на widget._controller
                    children: [
                      const SizedBox(
                          height: 50,
                          width: 50,
                          child: Center(
                              child: Text('''"Fuel Your Body, Find Your Balance"
Discover personalized keto diets and health calculators tailored to your goals. Whether it's body fat, metabolism, or calorie intake NutriFit guides you every step of the way to a healthier, more balanced you'''))),
                      Container(
                          child: const Center(
                              child: Text('''"Move More, Explore Better"
Find nearby sports salons and fitness centers with just a tap! NutriFit's smart map ensures you stay active and reach your fitness goals, no matter where you are.'''))),
                      SizedBox(
                          child: Container(
                              child: const Center(
                                  child: Text(
                                      '''"Your Health, Our Chatbot's Mission"
Got questions? NutriFit's AI-powered chatbot is here to support you 24/7 with personalized answers to keep your health journey on track. Ask away, and let the transformation begin!''')))),
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

                const SizedBox(height: 16),
                BasicAppButton(
                  onPressed: () {
                    context.router.push(const LoginRoute());
                  },
                  title: 'Login',
                  height: 65,
                  backgroundColor: AppColors.orange,
                ),
                const SizedBox(height: 21),
                BasicAppButton(
                  onPressed: () {
                    context.router.push(const RegisterRoute());
                  },
                  title: 'Register',
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
