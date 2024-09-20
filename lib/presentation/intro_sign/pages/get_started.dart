import 'package:flutter/material.dart';
import 'package:nutri_fit/common/widgets/button/basic_app_button.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/core/configs/theme/app_colors.dart';
import 'package:nutri_fit/presentation/auth/pages/sigin.dart';
import 'package:nutri_fit/presentation/auth/pages/signup.dart';
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
                SizedBox(
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
                SizedBox(
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
                SizedBox(
                  height: 80,
                ),

                const Spacer(),
                // PageView и индикатор
                SizedBox(
                  height: 100,
                  width: 100,
                  child: PageView(
                    controller: widget
                        ._controller, // Здесь исправлено на widget._controller
                    children: [
                      const SizedBox(
                          height: 50,
                          width: 50,
                          child: Center(child: Text('Page 1'))),
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

                const SizedBox(height: 16),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SigunPage(),
                      ),
                    );
                  },
                  title: 'SIGN IN',
                  height: 65,
                  backgroundColor: AppColors.orange,
                ),
                const SizedBox(height: 21),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => SigninPage(),
                      ),
                    );
                  },
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
