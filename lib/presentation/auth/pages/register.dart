import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutri_fit/common/widgets/appbar/app_bar.dart';
import 'package:nutri_fit/common/widgets/button/basic_app_button.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/core/configs/assets/app_vectors.dart';
import 'package:nutri_fit/core/configs/theme/app_colors.dart';
import 'package:nutri_fit/data/models/auth/create_user_req.dart';
import 'package:nutri_fit/domain/usecases/auth/signup.dart';
import 'package:nutri_fit/presentation/router/router.gr.dart';
import 'package:nutri_fit/service_locator.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.notification,
      appBar: const BasicAppbar(
        imagePath: AppImages.yazi,
        hideBack: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 175,
                    width: 175,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 245, 245, 237),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      border: Border.all(color: Colors.black.withOpacity(0.01)),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        AppImages.logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Start your journey',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Join NutriFit today and unlock your personalized path to fitness, nutrition, and well-being.",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25),
                _fullNameField(context),
                const SizedBox(height: 15),
                _emailField(context),
                const SizedBox(height: 15),
                _passwordField(context),
                const SizedBox(height: 15),
                BasicAppButton(
                    backgroundColor: AppColors.green,
                    height: 65,
                    onPressed: () async {
                      var result = await sl<SignupUseCase>().call(
                        params: CreateUserReq(
                          fullName: _fullName.text.toString(),
                          email: _email.text.toString(),
                          password: _password.text.toString(),
                        ),
                      );
                      result.fold(
                        (l) {
                          var snackBar = SnackBar(
                            content: Text(l),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        (r) {
                          context.router.replaceAll([const HomeRoute()]);
                        },
                      );
                    },
                    title: 'Register'),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Or register with'),
                    const Spacer(),
                    SizedBox(
                      width: 28,
                      height: 28.5,
                      child: SvgPicture.asset(
                        AppVectors.google,
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 29.0,
                      width: 36.0,
                      child: SvgPicture.asset(
                        AppVectors.apple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullName,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          size: 23,
          color: AppColors.darkgreen,
        ),
        hintText: 'Full Name',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  // Поле ввода Email
  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.email,
          size: 23,
          color: AppColors.darkgreen,
        ),
        hintText: 'Enter Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  // Поле ввода пароля с видимостью
  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      obscureText: !_isPasswordVisible, // Меняем видимость текста
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock,
          color: AppColors.darkgreen,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible =
                  !_isPasswordVisible; // Переключение видимости пароля
            });
          },
          icon: Icon(
            size: 23,
            _isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off, // Иконка в зависимости от состояния
          ),
        ),
        hintText: 'Enter Password',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }
}
