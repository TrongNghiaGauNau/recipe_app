import 'package:flutter/foundation.dart' show immutable;
import 'package:image_picker/image_picker.dart';


@immutable
class ImagePickerHelper {
  static final ImagePicker _imagePicker = ImagePicker();

  static Future pickImageFromGallery() =>
      _imagePicker.pickImage(source: ImageSource.gallery);

  static pickVideoFromGallery() =>
      _imagePicker.pickVideo(source: ImageSource.gallery);

  static pickImageFromCamera() =>
      _imagePicker.pickImage(source: ImageSource.camera);
}
