import 'package:FlutterGalleryApp/res/colors.dart';
import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/claim_bottom_sheet.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feed_screen.dart';

class FullScreenImageArguments {
  FullScreenImageArguments(
      {this.key,
      this.altDescription,
      this.userName,
      this.name,
      this.photo,
      this.userPhoto,
      this.heroTag,
      this.routeSettings});

  final Key key;
  final String altDescription;
  final String userName;
  final String name;
  final String photo;
  final String userPhoto;
  final String heroTag;
  final RouteSettings routeSettings;
}

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

class _FullScreenImageState extends State<FullScreenImage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _avatarOpacity;
  Animation<double> _userInfoOpacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _avatarOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.5,
          curve: Curves.ease,
        )));

    _userInfoOpacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.ease,
        )));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String userName = widget.userName ?? kUserName;
    if (!userName.startsWith("@")) {
      userName = "@" + widget.userName;
    }
    return Scaffold(
        appBar: _buildAppBar(),
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
                        maxLines: 3, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline3))),
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _controller,
                      child: UserAvatar(widget.userPhoto),
                      builder: (context, child) => Container(
                        child: Opacity(
                          opacity: _avatarOpacity.value.toDouble(),
                          child: child,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    AnimatedBuilder(
                      animation: _controller,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(widget.name ?? kName, style: Theme.of(context).textTheme.headline1),
                          Text(userName,
                              style: Theme.of(context).textTheme.headline5.copyWith(color: AppColors.manatee)),
                        ],
                      ),
                      builder: (context, child) => Container(
                        child: Opacity(
                          opacity: _userInfoOpacity.value.toDouble(),
                          child: child,
                        ),
                      ),
                    ),
                  ],
                )),
            Buttons()
          ],
        ));
  }

  AppBar _buildAppBar() {
    String title = ModalRoute.of(context).settings.arguments;
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text(
        'Photo',
        style: TextStyle(color: AppColors.black),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.more_vert,
              color: AppColors.grayChateau,
            ),
            onPressed: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  context: context,
                  builder: (context) {
                    return ClaimBottomSheet(() => Navigator.of(context).pop());
                  });
            })
      ],
      backgroundColor: AppColors.white,
      leading: IconButton(
        icon: Icon(
          CupertinoIcons.back,
          color: AppColors.grayChateau,
        ),
        tooltip: 'Go back',
        onPressed: () => Navigator.pop(context),
      ),
    );
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
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Alert Dialog title'),
                          content: Text('Alert dialog body'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Ok"),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancel"),
                            )
                          ],
                        ));
              },
              child: Button('Save', EdgeInsets.all(12))),
          GestureDetector(
              onTap: () async {
                OverlayState overlayState = Overlay.of(context);
                OverlayEntry overlayEntry = OverlayEntry(builder: (BuildContext context) {
                  return Positioned(
                      top: MediaQuery.of(context).viewInsets.top + 50,
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                            decoration:
                                BoxDecoration(color: AppColors.mercury, borderRadius: BorderRadius.circular(10)),
                            child: Text('SkillBranch'),
                          ),
                        ),
                      ));
                });
                overlayState.insert(overlayEntry);
                await Future.delayed(Duration(seconds: 1));
                overlayEntry.remove();
              },
              child: Button(
                'Visit',
                EdgeInsets.only(top: 12, bottom: 12),
              ))
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
            style: Theme.of(context).textTheme.headline4.copyWith(color: AppColors.white),
            textAlign: TextAlign.center,
          )),
    );
  }
}
