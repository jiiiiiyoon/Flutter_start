import 'package:flutter/material.dart';

class GetImage extends StatelessWidget {
  static const routeName = '/geimage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}