import 'package:FlutterGalleryApp/res/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  PhotoWidget({Key key, this.photoLink}) : super(key: key);

  final String photoLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(17)),
        child: Container(
          color:AppColors.alto,
          child: CachedNetworkImage(
            imageUrl: photoLink,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator(backgroundColor: AppColors.mercury,)),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.fill,
          ),
        )
      ),
    );
  }
}
