import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/auth_state_provider.dart';


class ButtonGoogleOrFacebook extends ConsumerWidget {
  ButtonGoogleOrFacebook({super.key, this.isGoogle = false});

  bool isGoogle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {
          ref.read(authStateProvider.notifier).loginWithGoogle();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: isGoogle ? Colors.lightBlueAccent : Colors.blue,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                isGoogle ? 'Continue with Google' : 'Continue with Facebook',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
