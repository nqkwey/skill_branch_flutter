import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'app.dart';

void main() {
  runApp(MyApp());
}

class ConnectivityOverlay {
  static final ConnectivityOverlay _singleton = ConnectivityOverlay._internal();
  static bool isShown = false;

  factory ConnectivityOverlay() {
    return _singleton;
  }

  ConnectivityOverlay._internal();

  static OverlayEntry overlayEntry;

  void showOverlay(BuildContext context, Widget child) {
    OverlayState overlayState = Overlay.of(context);
    overlayEntry = OverlayEntry(builder: (BuildContext context) {
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
                decoration: BoxDecoration(color: AppColors.mercury, borderRadius: BorderRadius.circular(10)),
                child: Text('No internet connection'),
              ),
            ),
          ));
    });
    overlayState.insert(overlayEntry);
    isShown = true;
  }

  void removeOverlay(BuildContext context) {
    if (isShown) {
      overlayEntry.remove();
      isShown = false;
    }
  }
}
