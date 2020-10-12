import 'package:FlutterGalleryApp/res/colors.dart';
import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feed_screen.dart';

class FullScreenImage extends StatefulWidget {
  final String altDescription;
  final String userName;
  final String name;
  final String photo;
  final String userPhoto;
  final String heroTag;

  FullScreenImage({
    Key key,
    this.altDescription,
    this.userName,
    this.name,
    this.photo,
    this.userPhoto,
    this.heroTag,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FullScreenImageState();
  }
}

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    String userName = widget.userName ?? kUserName;
    if (!userName.startsWith("@")) {
      userName = "@" + widget.userName;
    }
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Photo',
            style: TextStyle(color: AppColors.black),
          ),
          backgroundColor: AppColors.white,
          leading: IconButton(
            icon: Icon(CupertinoIcons.back, color: AppColors.grayChateau),
            tooltip: 'Go back',
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: <Widget>[
            Hero(
              tag: widget.heroTag,
              child: Photo(photoLink: widget.photo),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(widget.altDescription ?? kDescription,
                        maxLines: 3, overflow: TextOverflow.ellipsis, style: AppStyles.h3))),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  children: <Widget>[
                    UserAvatar(widget.userPhoto),
                    SizedBox(
                      width: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(widget.name ?? kName, style: AppStyles.h1Black),
                        Text(userName, style: AppStyles.h5Black.copyWith(color: AppColors.manatee)),
                      ],
                    )
                  ],
                )),
            Buttons()
          ],
        ));
  }
}

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          LikeButton(10, true),
          GestureDetector(onTap: () {}, child: Button('Save', EdgeInsets.all(12))),
          GestureDetector(onTap: () {}, child: Button('Visit', EdgeInsets.only(top: 12, bottom: 12)))
        ],
      ),
    );
  }
}

class Button extends Container {
  final String title;
  final EdgeInsets insets;

  Button(this.title, this.insets);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: insets,
      width: 105,
      height: 36,
      decoration: BoxDecoration(color: AppColors.dodgerBlue, borderRadius: BorderRadius.all(Radius.circular(7))),
      child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: AppStyles.h4.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          )),
    );
  }
}
