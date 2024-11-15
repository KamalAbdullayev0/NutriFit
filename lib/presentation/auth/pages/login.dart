import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nutri_fit/common/widgets/appbar/app_bar.dart';
import 'package:nutri_fit/common/widgets/button/basic_app_button.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/core/configs/assets/app_vectors.dart';
import 'package:nutri_fit/core/configs/theme/app_colors.dart';
import 'package:nutri_fit/data/models/auth/signin_user_req.dart';
import 'package:nutri_fit/domain/usecases/auth/signin.dart';
import 'package:nutri_fit/presentation/router/router.gr.dart';
import 'package:nutri_fit/service_locator.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BasicAppbar(
        imagePath: AppImages.yazi,
        hideBack: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
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
                        border:
                            Border.all(color: Colors.black.withOpacity(0.01)),
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
                  const SizedBox(height: 5),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Welcome back! Let's continue your journey to a healthier, fitter you with NutriFit.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  _emailField(),
                  const SizedBox(height: 15),
                  _passwordField(),
                  const SizedBox(height: 20),
                  BasicAppButton(
                      backgroundColor: AppColors.green,
                      height: 65,
                      onPressed: () async {
                        var result = await sl<SigninUseCase>().call(
                          params: SigninUserReq(
                            email: _email.text.toString(),
                            password: _password.text.toString(),
                          ),
                        );
                        result.fold(
                          (l) {
                            var snackBar = SnackBar(
                              content: Text(l),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          (r) {
                            context.router.replaceAll([const HomeRoute()]);
                          },
                        );
                      },
                      title: 'Sign In'),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Login with'),
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
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text('Don\'t have an account?'),
                      const SizedBox(height: 10),
                      BasicAppButton(
                        onPressed: () {
                          context.router.push(const RegisterRoute());
                        },
                        title: 'Create Account',
                        height: 65,
                        backgroundColor:
                            const Color.fromARGB(255, 218, 215, 215),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Поле ввода Email
  Widget _emailField() {
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
  Widget _passwordField() {
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
