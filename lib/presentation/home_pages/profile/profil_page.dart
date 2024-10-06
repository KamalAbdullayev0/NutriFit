import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ProfilPageWidget extends StatelessWidget {
  const ProfilPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Profil'),
        ),
      ),
    );
  }
}
