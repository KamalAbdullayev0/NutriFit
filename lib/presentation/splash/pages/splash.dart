import 'package:flutter/material.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/presentation/intro_sign/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(
                AppImages.logo,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Image.asset(
            AppImages.yazi,
            height: 60,
            width: 300,
          ),
          SizedBox(
            height: 130,
          ),
        ],
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => GetStarted(),
      ),
    );
  }
}
