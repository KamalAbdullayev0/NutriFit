import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/common/widgets/root_appbar/root_appbar.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/category_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/keto_meal_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/diet/bloc/user_cubit.dart';
import 'package:nutri_fit/presentation/home_pages/diet/widgets/card_widget.dart';
import 'package:nutri_fit/presentation/home_pages/diet/widgets/choose_food.dart';
import 'package:nutri_fit/presentation/home_pages/diet/widgets/date_widget.dart';
import 'package:nutri_fit/presentation/home_pages/diet/widgets/meals_widget.dart';

@RoutePage()
class DietPageWidget extends StatelessWidget {
  DietPageWidget({super.key});

  // int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UserCubit()..getUser(),
        ),
        BlocProvider<KetoMealCubit>(
          create: (_) => KetoMealCubit()..getKetoMeals(),
        ),
        BlocProvider(
          create: (_) => CategoryCubit()..getCategory(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const RootAppBar(
          imagePath: AppImages.ozun,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildDatePicker(context),
              CardWidget(),
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pick your diet",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const ChooseFood(),
              const Padding(
                padding: EdgeInsets.only(left: 16, top: 8, bottom: 4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Today's meals",
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 3, 65, 115)),
                  ),
                ),
              ),
              const MealsVertical(),
            ],
          ),
        ),
      ),
    );
  }
}
