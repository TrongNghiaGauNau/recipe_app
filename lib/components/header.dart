import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key,required this.textHeader});

  final String textHeader;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          textHeader,
          textAlign: TextAlign.left,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              wordSpacing: 5
          ),
        ),
      ),
    );
  }
}
