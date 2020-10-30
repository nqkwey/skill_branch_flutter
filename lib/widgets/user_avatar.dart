import 'package:FlutterGalleryApp/res/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserAvatar extends StatelessWidget {
  UserAvatar(this.photoUrl);

  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: CachedNetworkImage(
        imageUrl: photoUrl,
        width: 40,
        height: 40,
        fit: BoxFit.fill,
      ),
    );
  }
}
