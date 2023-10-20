import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/is_logged_provider.dart';
import 'package:recipe_food_app/providers/splash_screen_to_main_view_provider.dart';
import 'package:recipe_food_app/screens/home/home_screen.dart';
import 'package:recipe_food_app/screens/login/login_screen.dart';
import 'package:recipe_food_app/screens/main_view/main_view.dart';

class BodySplashScreen extends StatelessWidget {
  const BodySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/splash_screen.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          const Spacer(),
          Container(
            height: 50,
            width: 220,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  Text(
                    '60k+ Premium recipes',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          const Text(
            'Let\'s \n Cooking',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Find best recipes for cooking',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Consumer(
            builder: (context, ref, child) {
              final isLoggedIn = ref.watch(isLoggedInProvider);
              return InkWell(
                onTap: () {
                  ref.read(leaveSplashScreenNotifier.notifier).update((state) => state+1);
                  isLoggedIn
                      ? Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const MainView(),
                  ))
                      : Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ));
                },
                child: Container(
                  width: 230,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start cooking',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
