import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/model/meal_adapter.dart';
import 'package:recipe_food_app/model/meal_detail.dart';
import 'package:recipe_food_app/providers/splash_screen_to_main_view_provider.dart';
import 'package:recipe_food_app/screens/main_view/main_view.dart';
import 'package:recipe_food_app/screens/splash_screen/splash_screen.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pathDir = await path.getApplicationDocumentsDirectory();
  Hive.init(pathDir.path);
  Hive.initFlutter('favorite_db');
  Hive.registerAdapter<Meals>(MealsAdapter());

  // Open the Hive box for favorite meals
  await Hive.openBox<Meals>('favorite_meals');

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  @override
  void dispose() async {
    await Hive.box<Meals>('favorite_meals').close();
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final goToMainView = ref.watch(leaveSplashScreenNotifier);
    return MaterialApp(
      title: 'Food Recipe App',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: goToMainView == 0 ? const SplashScreen() : const MainView(),
    );
  }
}
