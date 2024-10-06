import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SportPageWidget extends StatelessWidget {
  const SportPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sport'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Sport'),
        ),
      ),
    );
  }
}
