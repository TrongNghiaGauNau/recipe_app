import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/splash_screen_to_main_view_provider.dart';
import 'package:recipe_food_app/screens/main_view/main_view.dart';
import 'package:recipe_food_app/screens/meal_detail/meal_detail.dart';
import 'package:recipe_food_app/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final goToMainView = ref.watch(leaveSplashScreenNotifier);
    return MaterialApp(
      title: 'Food Recipe App',
      theme: ThemeData.light(useMaterial3: true,),
      debugShowCheckedModeBanner: false,
      home: goToMainView == 0 ?const SplashScreen():const MainView(),
    );
  }
}

//adding this line to test branch
