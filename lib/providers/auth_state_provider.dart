import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/auth/auth_state.dart';
import 'package:recipe_food_app/auth/auth_state_notifier.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (_) => AuthStateNotifier(),
);
