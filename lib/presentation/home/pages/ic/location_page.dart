import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class LocationPageWidget extends StatelessWidget {
  const LocationPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Location'),
        ),
      ),
    );
  }
}
