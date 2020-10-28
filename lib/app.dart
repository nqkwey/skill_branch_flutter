import 'dart:io';

import 'package:FlutterGalleryApp/res/styles.dart';
import 'package:FlutterGalleryApp/screens/home.dart';
import 'package:FlutterGalleryApp/screens/photo_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens/feed_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: buildAppTextTheme(),
      ),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == "/fullScreenImage") {
          FullScreenImageArguments args = settings.arguments as FullScreenImageArguments;
          final route = FullScreenImage(
            photo: args.photo,
            altDescription: args.altDescription,
            userName: args.userName,
            name: args.name,
            heroTag: args.heroTag,
            userPhoto: args.userPhoto,
            key: args.key,
          );

          if (Platform.isAndroid) {
            return MaterialPageRoute(builder: (context) => route, settings: args.routeSettings);
          } else if (Platform.isIOS) {
            return CupertinoPageRoute(builder: (context) => route, settings: args.routeSettings);
          }
        }
        return null;
      },
      home: Home(),
    );
  }
}
