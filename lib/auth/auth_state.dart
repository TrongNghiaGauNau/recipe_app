import 'package:flutter/foundation.dart' show immutable;
import 'package:recipe_food_app/auth/auth_result.dart';
import 'package:recipe_food_app/model/user/user_info.dart';
import 'package:recipe_food_app/typdef/typdef.dart';

@immutable
class AuthState {
  final AuthResult? result;
  final bool isLoading;
  final UserId? userId;
  final UserThongTin? userInfo;

  const AuthState({
    required this.result,
    required this.isLoading,
    required this.userId,
    required this.userInfo,
  });

  const AuthState.unknown()
      : result = null,
        isLoading = false,
        userId = null,
        userInfo = null;

  AuthState copiedWithIsLoading(bool isLoading) => AuthState(
        result: result,
        isLoading: isLoading,
        userId: userId,
        userInfo: userInfo,
      );

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (result == other.result &&
          isLoading == other.isLoading &&
          userId == other.userId);

  @override
  int get hashCode => Object.hash(
        result,
        isLoading,
        userId,
      );
}
