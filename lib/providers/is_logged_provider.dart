import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/auth/auth_result.dart';
import 'package:recipe_food_app/providers/auth_state_provider.dart';

final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.result == AuthResult.success;
});
