import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavigatorStateNotifier extends StateNotifier<int> {
  NavigatorStateNotifier() : super(0);

  void changePage(int i) {
    state = i;
  }
}

final navigatorProvider = StateNotifierProvider<NavigatorStateNotifier, int>((ref) {
  return NavigatorStateNotifier();
});