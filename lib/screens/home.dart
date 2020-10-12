import 'package:FlutterGalleryApp/main.dart';
import 'package:FlutterGalleryApp/res/colors.dart';
import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/screens/feed_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int currentPosition = 0;
  final PageStorageBucket pageStorageBucket = PageStorageBucket();

  List<Widget> pages = [
    FeedRoute(key: PageStorageKey("FeedRoute"),),
    Container(),
    Container(),
  ];

  final List<GalleryBottomBarItem> _tabs = [
    GalleryBottomBarItem(
      asset: AppIcons.home,
      title: Text('Feed'),
      activeColor: AppColors.dodgerBlue,
      inactiveColor: AppColors.manatee,
    ),
    GalleryBottomBarItem(
      asset: AppIcons.home,
      title: Text('Search'),
      activeColor: AppColors.dodgerBlue,
      inactiveColor: AppColors.manatee,
    ),
    GalleryBottomBarItem(
      asset: AppIcons.home,
      title: Text('Profile'),
      activeColor: AppColors.dodgerBlue,
      inactiveColor: AppColors.manatee,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GalleryBottomBar(
        itemCornerRadius: 8,
        curve: Curves.ease,
        onItemSelected: (int position) {
          setState(() {
            currentPosition = position;
          });
        },
        currentTab: currentPosition,
        items: _tabs,
      ),
      body: pages[currentPosition],
    );
  }
}

class GalleryBottomBar extends StatelessWidget {
  GalleryBottomBar({
    Key key,
    this.backgroundColor = Colors.white,
    this.showElevation = true,
    this.containerHeight = 56,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.onItemSelected,
    this.items,
    this.currentTab,
    this.animationDuration = const Duration(milliseconds: 270),
    this.itemCornerRadius,
    this.curve,
  }) : super(key: key);

  final Color backgroundColor;
  final bool showElevation;
  final double containerHeight;
  final MainAxisAlignment mainAxisAlignment;
  final List<GalleryBottomBarItem> items;
  final ValueChanged<int> onItemSelected;
  final int currentTab;
  final Duration animationDuration;
  final double itemCornerRadius;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor, boxShadow: [
        if (showElevation) const BoxShadow(color: Colors.black12, blurRadius: 2),
      ]),
      child: SafeArea(
          child: Container(
        width: double.infinity,
        height: containerHeight,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: items.map((item) {
            var index = items.indexOf(item);

            return GestureDetector(
              onTap: () {
                onItemSelected(index);
              },
              child: _ItemWidget(
                isSelected: currentTab == index ? true : false,
                item: item,
                backgroundColor: backgroundColor,
                animationDuration: animationDuration,
                itemCornerRadius: itemCornerRadius,
                curve: curve,
              ),
            );
          }).toList(),
        ),
      )),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  _ItemWidget({
    @required this.isSelected,
    @required this.item,
    @required this.backgroundColor,
    @required this.animationDuration,
    @required this.curve,
    @required this.itemCornerRadius,
  }) {
    assert(animationDuration != null, 'Animation duration is null');
    assert(curve != null, 'Curve is null');
    assert(isSelected != null, 'isSelected is null');
    assert(backgroundColor != null, 'backgroundColor is null');
    assert(itemCornerRadius != null, 'itemCornerRadius is null');
    assert(item != null, 'item  is null');
  }

  final bool isSelected;
  final GalleryBottomBarItem item;
  final Color backgroundColor;
  final Duration animationDuration;
  final Curve curve;
  final double itemCornerRadius;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: animationDuration,
        width: isSelected ? 150 : (MediaQuery.of(context).size.width - 150 - 8 * 4 - 4 * 2) / 2,
        curve: curve,
        decoration: BoxDecoration(
            color: isSelected ? item.activeColor.withOpacity(0.2) : backgroundColor,
            borderRadius: BorderRadius.circular(itemCornerRadius)),
        child: Container(
          width: isSelected ? 150 : (MediaQuery.of(context).size.width - 150 - 8 * 4 - 4 * 2) / 2,
          padding: EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Icon(item.asset, size: 20, color: isSelected ? item.activeColor : item.inactiveColor),
              SizedBox(width: 4),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: DefaultTextStyle.merge(
                      child: item.title,
                      textAlign: item.textAlign,
                      maxLines: 1,
                      style: TextStyle(
                        color: isSelected ? item.activeColor : item.inactiveColor,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              )
            ],
          ),
        ));
  }
}

class GalleryBottomBarItem {
  GalleryBottomBarItem({this.asset, this.title, this.activeColor, this.inactiveColor, this.textAlign}) {
    assert(asset != null, 'Asset is null');
    assert(title != null, 'Title is null');
  }

  final IconData asset;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;
  final TextAlign textAlign;
}
