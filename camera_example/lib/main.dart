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
                  onPressed: () {},
                  child: Text('Camera'),
                ),
                FlatButton(
                  color: Colors.accents[5],
                  onPressed: () {},
                  child: Text('Gallery'),
                )
              ],
            ),
          ),
        )
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
}