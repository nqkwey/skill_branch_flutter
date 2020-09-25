import 'package:FlutterGalleryApp/res/colors.dart';
import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/screens/photo_screen.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/material.dart';

const String kFlutterDash = "https://flutter"
    ".dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png";

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
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PhotoRoute()),
              ),
              child: Column(children: <Widget>[
                _buildItem(),
                Divider(
                  thickness: 2,
                  color: AppColors.mercury,
                ),
              ]),
            );
          }),
    );
  }

  Widget _buildItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Photo(photoUrl: kFlutterDash),
        _buildPhotoMeta(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: Text('This is Flutter dash. I hate it!',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.h3),
        )
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
              UserAvatar(
                  'https://cdn.jpegmini.com/user/images/slider_puffin_jpegmini_mobile.jpg'),
              SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Dianne Miles",
                    style: AppStyles.h2Black,
                  ),
                  Text("@diannemiles",
                      style:
                          AppStyles.h5Black.copyWith(color: AppColors.manatee)),
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