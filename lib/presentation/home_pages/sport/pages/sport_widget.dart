import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_fit/core/configs/assets/app_images.dart';
import 'package:nutri_fit/presentation/home_pages/sport/bloc/sport_bloc.dart';
import 'package:nutri_fit/presentation/home_pages/sport/pages/widgets/appbar.dart';
import 'package:nutri_fit/presentation/home_pages/sport/pages/widgets/dates.dart';
import 'package:nutri_fit/presentation/home_pages/sport/pages/widgets/graph.dart';
import 'package:nutri_fit/presentation/home_pages/sport/pages/widgets/info.dart';
import 'package:nutri_fit/presentation/home_pages/sport/pages/widgets/stats.dart';
import 'package:nutri_fit/presentation/home_pages/sport/pages/widgets/steps.dart';

@RoutePage()
class SportPageWidget extends StatelessWidget {
  const SportPageWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        appBar: AppBar(),
      ),
      body: Column(
        children: [
          Dates(),
          Steps(),
          Graph(),
          Info(),
          Stats(),
        ],
      ),
    );
  }
}
