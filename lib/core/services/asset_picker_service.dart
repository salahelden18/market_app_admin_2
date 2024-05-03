import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AssetPickerService {
  static Future<XFile?> pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      return image;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<File>?> pickImages() async {
    try {
      final ImagePicker picker = ImagePicker();
      final List<XFile> pickedImages = await picker.pickMultiImage();
      final List<File> images = [];

      for (var image in pickedImages) {
        images.add(File(image.path));
      }

      return images;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
