import 'package:recipe_food_app/extension/pick_image_or_video/iamge_picker_helper.dart';

class PickImageOrVideo {
  pickImageFromGallery() async {
    //pick an image file
    final imageFile = await ImagePickerHelper.pickImageFromGallery();
    if (imageFile == null) {
      return;
    }
    return imageFile;
  }

  pickVideoFromGallery() async {
    final videoFile = await ImagePickerHelper.pickVideoFromGallery();
    if (videoFile == null) {
      return;
    }
    return videoFile;
  }

  pickImageFromCamera() async {
    final videoFile = await ImagePickerHelper.pickImageFromCamera();
    if (videoFile == null) {
      return;
    }
    return videoFile;
  }
}