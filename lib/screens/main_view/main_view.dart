import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/get_random_meal_provider.dart';
import 'package:recipe_food_app/providers/navigation_bar_provider.dart';
import 'package:recipe_food_app/screens/home/home_screen.dart';
import 'package:recipe_food_app/screens/main_view/components/bottom_app_bar.dart';
import 'package:recipe_food_app/screens/notifications/notifications_screen.dart';
import 'package:recipe_food_app/screens/save/save_screen.dart';
import '../profile/profile_screen.dart';

class MainView extends HookConsumerWidget {
  const MainView({super.key});

  static const List<Widget> pageDetails = [
    HomeScreen(),
    SaveScreen(),
    NotificationsScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(navigatorProvider);

    useEffect(() {
      if (pageIndex == 0) {
        ref.invalidate(randomMealProvider);
      }
    }, [pageIndex]);

    return Scaffold(
      body: pageDetails[pageIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
