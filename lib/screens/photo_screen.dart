import 'package:FlutterGalleryApp/res/colors.dart';
import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feed_screen.dart';

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
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Photo',
            style: TextStyle(color: AppColors.black),
          ),
          backgroundColor: AppColors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColors.grayChateau),
            tooltip: 'Go back',
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: <Widget>[
            FullScreenImage(photoLink: kFlutterDash),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Description('This is Flutter dash. I hate it!'))),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              child: UserInfo(),
            ),
            Buttons()
          ],
        ));
  }
}

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        UserAvatar(
            'https://cdn.jpegmini.com/user/images/slider_puffin_jpegmini_mobile.jpg'),
        SizedBox(
          width: 6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Name("Dianne Miles"),
            Nickname("@diannemiles"),
          ],
        )
      ],
    );
  }
}

class Name extends Text {
  String name;

  Name(this.name) : super(name);

  @override
  Widget build(BuildContext context) {
    return Text(name, style: AppStyles.h1Black);
  }
}

class Nickname extends Text {
  String userName;

  Nickname(this.userName) : super(userName);

  @override
  Widget build(BuildContext context) {
    return Text(userName,
        style: AppStyles.h5Black.copyWith(color: AppColors.manatee));
  }
}

class Description extends Text {
  String altDescription;

  Description(this.altDescription) : super(altDescription);

  @override
  Widget build(BuildContext context) {
    return Text(altDescription,
        maxLines: 3, overflow: TextOverflow.ellipsis, style: AppStyles.h3);
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
          GestureDetector(
              onTap: () {},
              child: Button('Save', EdgeInsets.all(12))),
          GestureDetector(
              onTap: () {},
              child: Button('Visit', EdgeInsets.only(top: 12, bottom: 12)))
        ],
      ),
    );
  }
}

class Button extends Container {
  String title;
  EdgeInsets insets;

  Button(this.title, this.insets);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: insets,
      width: 105,
      height: 36,
      decoration: BoxDecoration(
          color: AppColors.dodgerBlue,
          borderRadius: BorderRadius.all(Radius.circular(7))),
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
