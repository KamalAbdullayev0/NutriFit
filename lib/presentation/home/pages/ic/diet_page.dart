import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';



@RoutePage()
class DietPageWidget extends StatelessWidget {
  const DietPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet'),
      ),
      body: const Placeholder(),
    );
  }
}
