import 'package:FlutterGalleryApp/data/data_api.dart';
import 'package:FlutterGalleryApp/models/photo_list/model.dart';
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
  ScrollController _scrollController = ScrollController();
  int pageCount = 0;
  bool isLoading = false;
  var data = List<Photo>();

  @override
  void initState() {
    super.initState();
    this._getData(pageCount);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8) {
        _getData(pageCount);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: data.length,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                "/fullScreenImage",
                arguments: FullScreenImageArguments(
                  routeSettings: RouteSettings(
                    arguments: 'Some title',
                  ),
                  photo: data[index].urls.regular,
                  altDescription: data[index].altDescription,
                  userName: data[index].user.username,
                  name: data[index].user.name,
                  userPhoto: data[index].user.profileImage.medium,
                  heroTag: data[index].urls.regular,
                ),
              ),
              child: Column(children: <Widget>[
                _buildItem(data[index]),
                Divider(
                  thickness: 2,
                  color: AppColors.mercury,
                ),
              ]),
            );
          }),
    );
  }

  Widget _buildItem(Photo photo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Hero(
          tag: photo.urls.regular,
          child: PhotoWidget(photoLink: photo.urls.regular),
        ),
        _buildPhotoMeta(photo),
        Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Description(photo.altDescription))
      ],
    );
  }

  Widget _buildPhotoMeta(Photo photo) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              UserAvatar(photo.user.profileImage.medium),
              SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Name(photo.user.name),
                  Nickname(photo.user.username),
                ],
              )
            ],
          ),
          LikeButton(10, photo.likedByUser),
        ],
      ),
    );
  }

  void _getData(int page) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var tempList = await DataProvider.getPhotos(page, 10);

      setState(() {
        isLoading = false;
        data.addAll(tempList.photos);
        pageCount++;
      });
    }
  }
}

class Name extends Text {
  final String text;

  Name(this.text) : super(text == null ? "" : text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headline1);
  }
}

class Nickname extends Text {
  final String text;

  Nickname(this.text) : super(text == null ? "" : text);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headline5.copyWith(color: AppColors.manatee));
  }
}

class Description extends Text {
  final String text;

  Description(this.text) : super(text == null ? "" : text);

  @override
  Widget build(BuildContext context) {
    return Text(text, maxLines: 3, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.headline3);
  }
}
