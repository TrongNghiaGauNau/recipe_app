import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/auth_state_provider.dart';

class AvatarPart extends ConsumerWidget {
  const AvatarPart({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/food_bowl.jpg'),
            ),
          ),
          Consumer(builder: (context, ref, child) {
            return GestureDetector(
              onTap: () {
                ref.read(authStateProvider.notifier).logOut();
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.red)),
                child: const Center(
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
