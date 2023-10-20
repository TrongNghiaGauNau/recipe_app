import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/auth/auth_result.dart';
import 'package:recipe_food_app/auth/auth_state.dart';
import 'package:recipe_food_app/auth/authenticator.dart';
import 'package:recipe_food_app/backend/user_info_storage.dart';
import 'package:recipe_food_app/repository/meal_api.dart';
import 'package:recipe_food_app/typdef/typdef.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = const Authenticator();
  final _userInfoStorage = const UserInfoStorage();

  AuthStateNotifier() : super(const AuthState.unknown()) {
    //if user already login
    if (_authenticator.isAlreadyLoggedIn) {
      // final userInfo =
      // state = AuthState(
      //   result: AuthResult.success,
      //   isLoading: false,
      //   userId: _authenticator.userId,
      //   userInfo: userInfo,
      // );
      final userId = _authenticator.userId;
      fetchUserInfo(userId); // Call the function to fetch user info
    }

  }

  Future<void> fetchUserInfo(UserId? userId) async {
    final userThongTin = await getUserInfo(userId!);
    if (userThongTin != null) {
      // User information is available
      state = AuthState(
        result: AuthResult.success,
        isLoading: false,
        userId: userId,
        userInfo: userThongTin, // Set the userInfo field with the fetched data
      );
    } else {
      // User not found
      state = AuthState(
        result: AuthResult.failure,
        isLoading: false,
        userId: userId,
        userInfo: null, // Set userInfo to null if the user is not found
      );
    }
  }

  Future<void> logOut() async {
    state = state.copiedWithIsLoading(true);
    await _authenticator.logOut();
    state = const AuthState.unknown();
  }

  Future<void> loginWithGoogle() async {
    state = state.copiedWithIsLoading(true);
    final result = await _authenticator.loginWithGoogle();
    final userId = _authenticator.userId;
    if (result == AuthResult.success && userId != null) {
      await saveUserInfo(userId: userId);
    }
    final userThongTin = await getUserInfo(userId!);
    state = AuthState(
      result: result,
      isLoading: false,
      userId: userId,
      userInfo: userThongTin,
    );

  }

  Future<void> saveUserInfo({required UserId userId}) =>
      _userInfoStorage.saveUserInfo(
        userId: userId,
        displayName: _authenticator.displayName,
        email: _authenticator.email,
      );
}
