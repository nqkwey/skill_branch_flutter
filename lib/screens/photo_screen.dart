import 'package:FlutterGalleryApp/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhotoRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PhotoRouteState();
  }
}

class _PhotoRouteState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Photo',
          style: TextStyle(color: AppColors.black),
        ),
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: new Image.asset('assets/icons/backBtn.png'),
          tooltip: 'Closes application',
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
