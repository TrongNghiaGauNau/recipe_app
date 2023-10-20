import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recipe_food_app/constants/constanst.dart';
import 'package:recipe_food_app/constants/file_type.dart';
import 'package:recipe_food_app/model/meal.dart';
import 'package:recipe_food_app/providers/upload_new_recipe/could_not_build_thumbnail_exception.dart';
import 'package:recipe_food_app/typdef/typdef.dart';
import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';


class RecipeUploadNotifier extends StateNotifier<IsLoading> {
  RecipeUploadNotifier() : super(false);

  set isLoading(bool value) => state = value;

  Future<bool> upload({
    required File file,
    required FileType fileType,
    required UserId userId,
    required String mealName,
    required String area,
    required String category,
    required List<String> ingredients,
  }) async {
    isLoading = true;

    late Uint8List thumbnailUint8List;

    switch (fileType) {
      case FileType.image :
        final fileAsImage = img.decodeImage(file.readAsBytesSync());
        if (fileAsImage == null) {
          isLoading = false;
          throw const CouldNotBuildThumbnailException();
        }
        //create thumbnail
        final thumbnail = img.copyResize(
          fileAsImage,
          width: imageThumbnailWidth,
        );
        final thumbnailData = img.encodeJpg(thumbnail);
        thumbnailUint8List = Uint8List.fromList(thumbnailData);
        break;
      case FileType.video:
        final thumb = await VideoThumbnail.thumbnailData(
          video: file.path,
          imageFormat: ImageFormat.JPEG,
          maxHeight: videoThumbnailMaxHeight,
          quality: videoThumbnailQuality,
        );
        if (thumb == null) {
          isLoading = false;
          throw const CouldNotBuildThumbnailException();
        } else {
          thumbnailUint8List = thumb;
        }
        break;
    }


    //calculate references
    final idMeal = const Uuid().v4();

    //create references to the thumbnail and the image itself

    final thumbnailRef = FirebaseStorage.instance
        .ref()
        .child(userId)
        .child('thumbnails')
        .child(idMeal);

    final originalFileRef = FirebaseStorage.instance
        .ref()
        .child(userId)
        .child(fileType.collectionName)
        .child(idMeal);

    try {
      //upload the thumbnail
      final thumbnailUploadTask =
      await thumbnailRef.putData(thumbnailUint8List);
      final thumbnailStorageId = thumbnailUploadTask.ref.name;

      //upload the original file
      final originalFileUploadTask = await originalFileRef.putFile(file);
      final originalFileStorageId = originalFileUploadTask.ref.name;

      //upload the meal itself
      final mealPayload = Meal(
        idMeal: idMeal,
        uid: userId,
        mealName: mealName,
        area: area,
        category: category,
        fileType: fileType,
        thumbnailUrl: await thumbnailRef.getDownloadURL(),
        fileUrl: await originalFileRef.getDownloadURL(),
        thumbnailStorageId: thumbnailStorageId,
        originalFileStorageId: originalFileStorageId,
        ingredients: ingredients,
      );

      await FirebaseFirestore.instance
          .collection('meals')
          .add(mealPayload);

      return true;


    } catch (_) {
      return false;
    } finally {
      isLoading = false;
    }
  }
}
