import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.selectedImage});

  final void Function(File image) selectedImage;

  @override
  State<ImageInput> createState() {
    return ImageInputState();
  }
}

class ImageInputState extends State<ImageInput> {
  File? selectedImage;

  void _addImage() async {
    final imagePicker = ImagePicker();

    final response = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (response == null) {
      return;
    }
    setState(() {
      selectedImage = File(response.path);
    });

    widget.selectedImage(selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ElevatedButton.icon(
      onPressed: _addImage,
      icon: Icon(Icons.camera_alt),
      label: Text('Add Image'),
    );
    if (selectedImage != null) {
      content = Image.file(
        selectedImage!,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      );
    }

    return GestureDetector(
      onTap: _addImage,
      child: Container(
        height: 300,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        child: content,
      ),
    );
  }
}
