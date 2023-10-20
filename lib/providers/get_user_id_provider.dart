import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/auth_state_provider.dart';
import 'package:recipe_food_app/typdef/typdef.dart';

final userIdProvider = Provider<UserId?>(
  (ref) => ref.watch(authStateProvider).userId,
);
