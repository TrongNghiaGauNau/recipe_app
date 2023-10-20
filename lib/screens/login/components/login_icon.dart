import 'package:flutter/material.dart';

class LoginIcon extends StatelessWidget {
  const LoginIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Log In',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          Icons.login,
          color: Colors.redAccent,
          size: 30,
        )
      ],
    );
  }
}