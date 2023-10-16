import 'package:flutter/material.dart';
import 'package:recipe_food_app/screens/splash_screen/components/body_spash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodySplashScreen(),
    );
  }
}
