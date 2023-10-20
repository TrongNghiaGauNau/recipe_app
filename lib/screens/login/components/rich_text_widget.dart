import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recipe_food_app/screens/login/components/link_text.dart';
import 'package:recipe_food_app/screens/login/components/rich_text.dart';


class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    super.key,
    this.styleForAll,
    required this.texts,
  });

  final Iterable<BaseText> texts;
  final TextStyle? styleForAll;

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      children: texts.map((baseText){
        if(baseText is LinkText){
          return TextSpan(
            text: baseText.text,
            style: styleForAll?.merge(baseText.style),
            recognizer: TapGestureRecognizer()..onTap = baseText.onTapped,
          );
        }else{
          return TextSpan(
            text: baseText.text,
            style: styleForAll?.merge(baseText.style),
          );
        }
      }).toList(),
    ));
  }
}
