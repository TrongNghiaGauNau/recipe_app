import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/loading_provider.dart';
import 'package:recipe_food_app/screens/login/components/button_google_or_facebook.dart';
import 'package:recipe_food_app/screens/login/components/login_icon.dart';
import 'package:recipe_food_app/screens/login/components/login_view_signup_link.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            const LoginIcon(),
            ButtonGoogleOrFacebook(),
            const Divider(),
            ButtonGoogleOrFacebook(
              isGoogle: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer(builder: (context, ref, child) {
              final isLoading = ref.watch(isLoadingProvider);
              if(isLoading){
                return const CircularProgressIndicator();
              }else{
                return Container();
              }
            },),
            const SizedBox(
              height: 20,
            ),
            const LoginViewSignupLink(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
