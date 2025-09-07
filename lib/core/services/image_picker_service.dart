import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  /// Pick image from gallery
  Future<File?> pickImageFromGallery() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file != null ? File(file.path) : null;
  }

  /// Pick image from camera
  Future<File?> pickImageFromCamera() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file != null ? File(file.path) : null;
  }

  /// Pick multiple images
  Future<List<File>> pickMultipleImages() async {
    final List<XFile> files = await _picker.pickMultiImage();
    return files.map((f) => File(f.path)).toList();
  }

  /// Pick video from gallery
  Future<File?> pickVideoFromGallery() async {
    final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);
    return file != null ? File(file.path) : null;
  }

  /// Pick video from camera
  Future<File?> pickVideoFromCamera() async {
    final XFile? file = await _picker.pickVideo(source: ImageSource.camera);
    return file != null ? File(file.path) : null;
  }
}
