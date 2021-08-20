import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  File _image;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Camera',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                FlatButton(
                  color: Colors.accents[2],
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  child: Text('Camera'),
                ),
                FlatButton(
                  color: Colors.accents[5],
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  child: Text('Gallery'),
                ),
                showImage()
              ],
            ),
          ),
        )
    );
  }

  Widget showImage() {
    if (_image == null)
      return Container();
    else
      return Image.file(_image);
  }

  Future getImage(ImageSource imageSource) async {
    var image = await ImagePicker.pickImage(source: imageSource);

    setState(() {
      _image = image;
    });
  }
}