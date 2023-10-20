import 'package:flutter/material.dart';
import 'package:recipe_food_app/screens/profile/components/body_profile_scree.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(
            top: 15,
            left: 10,
          ),
          child: Text(
            'My profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: const BodyProfileScreen(),
    );
  }
}
