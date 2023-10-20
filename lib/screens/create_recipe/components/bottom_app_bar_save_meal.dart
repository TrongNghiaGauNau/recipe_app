import 'package:flutter/material.dart';

class BottomAppBarSaveMeal extends StatelessWidget {
  const BottomAppBarSaveMeal({
    super.key,
    required this.size,
    required this.saveMeal,
  });

  final Size size;
  final GestureTapCallback saveMeal;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: size.height * 0.13,
      child: GestureDetector(
        onTap: saveMeal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Save my recipe',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}