import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/components/header.dart';
import 'package:recipe_food_app/constants/file_type.dart';
import 'package:recipe_food_app/constants/firebase_filed_name.dart';
import 'package:recipe_food_app/extension/pick_image_or_video/pick_image_or_video.dart';
import 'package:recipe_food_app/providers/get_user_id_provider.dart';
import 'package:recipe_food_app/providers/loading_provider.dart';
import 'package:recipe_food_app/providers/upload_new_recipe/recipe_upload_provider.dart';
import 'package:recipe_food_app/screens/create_recipe/components/bottom_app_bar_save_meal.dart';
import 'package:recipe_food_app/screens/create_recipe/components/ingredients_list.dart';
import 'package:recipe_food_app/screens/create_recipe/components/ingredients_title.dart';
import 'package:recipe_food_app/screens/create_recipe/components/pick_image_or_video_card.dart';
import 'package:recipe_food_app/screens/create_recipe/components/text_field_recipe.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class CreateRecipe extends StatefulHookConsumerWidget {
  const CreateRecipe({super.key});

  @override
  ConsumerState<CreateRecipe> createState() => _CreateRecipeState();
}

class _CreateRecipeState extends ConsumerState<CreateRecipe> {
  @override
  Widget build(BuildContext context) {
    //biến quản lý size màn hình
    final size = MediaQuery.of(context).size;
    //biến quản lý form text field
    final formKey = useMemoized(() => GlobalKey<FormState>());
    //biến để upload meal lên firebase
    final pickImageOrVideo = PickImageOrVideo();
    final fileToPost = useState<File?>(null);
    final videoThumb = useState<Uint8List?>(null);
    final fileType = useState(FileType.image);
    final mealName = useTextEditingController();
    final area = useTextEditingController();
    final category = useTextEditingController();
    final ingredients = useValueNotifier<List<TextEditingController>>(
        [TextEditingController()]);
    //xu ly hien thi dialog loading
    ref.listen(isLoadingProvider, (previous, isLoading) {
      if (isLoading) {
        showDialog(
          context: context,
          builder: (_) {
            return const AlertDialog(
              title: Text('Uploading Recipe'),
              content: Text(
                'Please wait a moment\nUploading....',
                textAlign: TextAlign.center,
              ),
            );
          },
        );
      }
    });

    //hàm xử lý upload dữ liệu lên firebase
    saveMeal() async {
      if (!formKey.currentState!.validate()) {
        return;
      }
      final userId = ref.read(userIdProvider);
      if (userId == null) {
        return;
      }

      final isUploaded = await ref.read(recipeUploadProvider.notifier).upload(
            userId: userId,
            mealName: mealName.value.text,
            area: area.value.text,
            category: category.value.text,
            file: fileToPost.value!,
            fileType: fileType.value,
            ingredients: ingredients.value
                .map((ingredientsTextEdit) => ingredientsTextEdit.text)
                .toList(),
          );
      if (isUploaded && mounted) {
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          //pick video
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () async {
              final videoFile = await pickImageOrVideo.pickVideoFromGallery();
              if (videoFile == null) {
                return;
              }
              //đề phòng dể cái màn hình pick lâu quá cái nó bay luôn cái app
              if (!mounted) {
                return;
              }

              final videoThumbnail = await VideoThumbnail.thumbnailData(
                video: videoFile.path,
                imageFormat: ImageFormat.JPEG,
                maxWidth: 128,
                // specify the width of the thumbnail, let the height auto-scaled to keep the source aspect ratio
                quality: 25,
              );
              videoThumb.value = videoThumbnail;
              fileToPost.value = File(videoFile.path);
              fileType.value = FileType.video;
            },
          ),
          //pick image gal
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: () async {
              final imageFile = await pickImageOrVideo.pickImageFromGallery();
              if (imageFile == null) {
                return;
              }
              //đề phòng dể cái màn hình pick lâu quá cái nó bay luôn cái app
              if (!mounted) {
                return;
              }
              fileToPost.value = File(imageFile.path);
            },
          ),
          //pick image camera
          IconButton(
            icon: const Icon(Icons.camera),
            onPressed: () async {
              final cameraFile = await pickImageOrVideo.pickImageFromCamera();
              if (cameraFile == null) {
                return;
              }
              //đề phòng dể cái màn hình pick lâu quá cái nó bay luôn cái app
              if (!mounted) {
                return;
              }
              fileToPost.value = File(cameraFile.path);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Header(textHeader: 'Create Recipe'),
              PickImageOrVideoCard(
                imageToPost: fileToPost.value,
                videoToPost: videoThumb.value,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    TextFieldRecipe(
                      controller: mealName,
                      hintText: 'Meal name',
                      icon: const Icon(
                        Icons.drive_file_rename_outline,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFieldRecipe(
                      controller: category,
                      hintText: 'Category',
                      icon: const Icon(
                        Icons.category_outlined,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFieldRecipe(
                      controller: area,
                      hintText: 'Area',
                      icon: const Icon(
                        Icons.location_on,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const IngredientsTitle(),
                    const SizedBox(height: 10),
                    IngredientsList(
                      size: size,
                      ingredientsList: ingredients,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBarSaveMeal(size: size, saveMeal: saveMeal),
    );
  }
}
