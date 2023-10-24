import 'package:flutter/material.dart';
import 'package:recipe_food_app/screens/recripe_detail/components/iamge_recipe.dart';
import 'package:video_player/video_player.dart';

class MealDetailImage extends StatefulWidget {
  const MealDetailImage({
    super.key,
    required this.image,
    required this.fileType,
  });

  final String image;
  final String fileType;

  @override
  State<MealDetailImage> createState() => _MealDetailImageState();
}

class _MealDetailImageState extends State<MealDetailImage> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.image))
      ..initialize().then((_) {
        _videoController.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.fileType == 'image'
          ? ImageRecipe(imageUrl: widget.image)
          : Center(
              child: _videoController.value.isInitialized
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: _videoController.value.aspectRatio,
                              child: VideoPlayer(_videoController),
                            ),
                            Positioned.fill(
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: VideoProgressIndicator(
                                      _videoController,
                                      allowScrubbing: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => _videoController.pause(),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              child: const Icon(Icons.pause),
                            ),
                            ElevatedButton(
                              onPressed: () => _videoController.play(),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              child: const Icon(Icons.play_arrow),
                            ),
                          ],
                        ),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
    );
  }
}
