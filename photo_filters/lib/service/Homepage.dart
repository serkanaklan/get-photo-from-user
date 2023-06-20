import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //I defined camera and gallery common variable
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        if (_image != null) Image.file(_image as File) else CircleAvatar(),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //I added the camera and gallery codes to the pressed feature.
              IconButton(onPressed: Camera, icon: Icon(Icons.camera_alt)),
              IconButton(onPressed: Gallery, icon: Icon(Icons.photo_outlined))
            ],
          ),
        ),
      ],
    ));
  }

  //code to take photo with camera
  Future<void> Camera() async {
    XFile camImg;
    final MyCam = ImagePicker();
    final XFile? camera = await MyCam.pickImage(source: ImageSource.camera);
    if (camera != null) {
      setState(() {
        _image = File(camera.path);
      });
    } else {
      Placeholder();
    }
  }

  //code to select photo from gallery
  Future<void> Gallery() async {
    XFile? galImg;
    final MyGal = ImagePicker();
    final XFile? galeri = await MyGal.pickImage(source: ImageSource.gallery);
    if (galeri != null) {
      setState(() {
        _image = File(galeri.path);
      });
    } else {
      Placeholder();
    }
  }
}
