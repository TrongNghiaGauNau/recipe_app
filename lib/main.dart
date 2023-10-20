import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/firebase_options.dart';
import 'package:recipe_food_app/model/meal_adapter.dart';
import 'package:recipe_food_app/model/meal_detail.dart';
import 'package:recipe_food_app/providers/is_logged_provider.dart';
import 'package:recipe_food_app/providers/loading_provider.dart';
import 'package:recipe_food_app/providers/splash_screen_to_main_view_provider.dart';
import 'package:recipe_food_app/screens/home/home_screen.dart';
import 'package:recipe_food_app/screens/loading/loading_screen.dart';
import 'package:recipe_food_app/screens/login/login_screen.dart';
import 'package:recipe_food_app/screens/main_view/main_view.dart';
import 'package:recipe_food_app/screens/splash_screen/splash_screen.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //call this to use firebase in this app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
    final isLoggedIn = ref.watch(isLoggedInProvider);
    final navigateIfSignIn = ref.watch(leaveSplashScreenNotifier);
    Widget content = const LoginScreen();
    if (isLoggedIn) content = const MainView();

    return MaterialApp(
      title: 'Food Recipe App',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: navigateIfSignIn == 0 ? const SplashScreen() : content,
      home: isLoggedIn ? const MainView() : const LoginScreen(),
    );
  }
}
