import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import '../../../providers/navigation_bar_provider.dart';

class CustomButtonNavigation extends HookConsumerWidget {
  const CustomButtonNavigation({
    super.key,
    required this.selectedPageIndex,
    required this.icon,
  });

  final int selectedPageIndex;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(navigatorProvider);
    // if (selectedPageIndex == 0) () => ref.read(randomMealProvider);
    return InkWell(
      onTap: () {
        ref.read(navigatorProvider.notifier).changePage(selectedPageIndex);
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: color == selectedPageIndex ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
