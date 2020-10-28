import 'package:FlutterGalleryApp/res/colors.dart';
import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/screens/photo_screen.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/material.dart';

const String kFlutterDash = "https://flutter"
    ".dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png";

const String kDescription = 'This is Flutter dash. I hate it!';
const String kName = 'Dianne Miles';
const String kUserName = '@diannemiles';
const String kUserPhoto = 'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&w=500&q=80';

class FeedRoute extends StatefulWidget {
  FeedRoute({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FeedRouteState();
  }
}

class _FeedRouteState extends State<FeedRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                "/fullScreenImage",
                arguments: FullScreenImageArguments(
                  routeSettings: RouteSettings(
                    arguments: 'Some title',
                  ),
                  photo: kFlutterDash,
                  altDescription: kDescription,
                  userName: kUserName,
                  name: kName,
                  userPhoto: kUserPhoto,
                  heroTag: kFlutterDash + index.toString(),
                ),
              ),
              child: Column(children: <Widget>[
                _buildItem(index),
                Divider(
                  thickness: 2,
                  color: AppColors.mercury,
                ),
              ]),
            );
          }),
    );
  }

  Widget _buildItem(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Hero(tag: kFlutterDash + index.toString(), child: Photo(photoLink: kFlutterDash)),
        _buildPhotoMeta(),
        Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Description(kDescription))
      ],
    );
  }

  Widget _buildPhotoMeta() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              UserAvatar(kUserPhoto),
              SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Name(kName),
                  Nickname(kUserName),
                ],
              )
            ],
          ),
          LikeButton(10, true),
        ],
      ),
    );
  }
}

class Name extends Text {
  final String text;

  Name(this.text) : super(text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headline1);
  }
}

class Nickname extends Text {
  final String text;

  Nickname(this.text) : super(text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headline5.copyWith(color: AppColors.manatee));
  }
}

class Description extends Text {
  final String text;

  Description(this.text) : super(text);

  @override
  Widget build(BuildContext context) {
    return Text(text, maxLines: 3, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline3);
  }
}
