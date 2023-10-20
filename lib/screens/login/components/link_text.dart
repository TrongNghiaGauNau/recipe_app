import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show immutable, VoidCallback;
import 'package:recipe_food_app/screens/login/components/rich_text.dart';

@immutable
class LinkText extends BaseText {
  final VoidCallback onTapped;

  const LinkText({
    required super.text,
    required this.onTapped,
    super.style,
  });
}
