import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  static Widget initPage(BuildContext context) {
    return const Scaffold(
      body: CameraScreen(),
    );
  }

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _file;
  ImagePicker? _imagePicker;

  @override
  void initState() {
    _imagePicker = ImagePicker();
    showCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: _file != null
              ? Image.file(
                  _file!,
                  fit: BoxFit.fill,
                )
              : Container(),
        ),
        Align(
          alignment: const Alignment(-0.85, -0.815),
          child: CircleAvatar(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_outlined),
            ),
          ),
        ),
        Align(
          alignment: const Alignment(1, 0),
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.post_add)),
                const SizedBox(height: 25),
                IconButton(onPressed: () {}, icon: const Icon(Icons.post_add)),
                const SizedBox(height: 25),
                IconButton(onPressed: () {}, icon: const Icon(Icons.post_add)),
              ],
            ),
          ),
        )
      ],
    );
  }

  showCamera() async {
    await _imagePicker!
        .pickImage(
            source: ImageSource.camera,
            imageQuality: 50,
            preferredCameraDevice: CameraDevice.front)
        .then((value) {
      try {
        _file = File(value!.path);
      } catch (e) {
        Logger().e('Image Selection cancelled');
        Navigator.of(context).pop();
      } finally {
        setState(() {
          _file = _file;
        });
      }
    });
  }
}
