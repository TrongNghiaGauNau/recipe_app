import 'package:flutter/material.dart';
import 'package:recipe_food_app/screens/login/components/constants.dart';
import 'package:recipe_food_app/screens/login/components/rich_text.dart';
import 'package:recipe_food_app/screens/login/components/rich_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginViewSignupLink extends StatelessWidget {
  const LoginViewSignupLink({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RichTextWidget(
        styleForAll: Theme.of(context).textTheme.subtitle1?.copyWith(height: 1.5),
        texts: [
          BaseText.plain(
            text: Strings.dontHaveAnAccount,
          ),
          BaseText.plain(
            text: Strings.signUpOn,
          ),
          BaseText.link(
            text: Strings.facebook,
            onTapped: () {
              launchUrl(
                Uri.parse(Strings.facebookSignupUrl),
              );
            },
          ),
          BaseText.plain(
            text: Strings.orCreateAnAccountOn,
          ),
          BaseText.link(
            text: Strings.google,
            onTapped: () {
              launchUrl(
                Uri.parse(Strings.googleSignupUrl),
              );
            },
          ),
        ],
      ),
    );
  }
}
