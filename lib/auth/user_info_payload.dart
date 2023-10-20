import 'dart:collection' show MapView;
import 'package:flutter/foundation.dart' show immutable;
import 'package:recipe_food_app/constants/firebase_filed_name.dart';
import 'package:recipe_food_app/typdef/typdef.dart';

@immutable
class UserInfoPayload extends MapView<String, String> {
  UserInfoPayload({
    required UserId userId,
    required String? displayName,
    required String? email,
  }) : super({
          FirebaseFieldName.userId: userId,
          FirebaseFieldName.displayName: displayName ?? '',
          FirebaseFieldName.email: email ?? '',
        });
}
