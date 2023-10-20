import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/providers/video_or_recipe_tab_provder.dart';

class VideoOrRecipeTab extends ConsumerWidget {
  const VideoOrRecipeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVideoTab = ref.watch(videoOrRecipeTabProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => ref.read(videoOrRecipeTabProvider.notifier).state = true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isVideoTab ? Colors.red : Colors.transparent,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 60,
                ),
                child: Text(
                  'Video',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: isVideoTab ? Colors.white : Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () =>
              ref.read(videoOrRecipeTabProvider.notifier).state = false,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isVideoTab ? Colors.transparent : Colors.red,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 60,
                ),
                child: Text(
                  'Recipe',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: isVideoTab ? Colors.red : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
