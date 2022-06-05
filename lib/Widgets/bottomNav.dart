import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bottomNav(context, changePage, currentIndex) {
  Color color1 = Theme.of(context).primaryColor;

  return BubbleBottomBar(
    opacity: 1.0,
    backgroundColor: Colors.white,
    currentIndex: currentIndex,
    onTap: changePage,
    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    elevation: 8,
    fabLocation: BubbleBottomBarFabLocation.end, //new
    hasNotch: true, //new
    hasInk: true, //new, gives a cute ink effect
    inkColor: Colors.black12, //optional, uses theme color if not specified
    items: <BubbleBottomBarItem>[
      BubbleBottomBarItem(
          backgroundColor: color1,
          icon: Icon(
            Icons.people_alt_outlined,
            size: 25,
            color: color1,
          ),
          activeIcon: Icon(
            Icons.people_alt,
            color: Colors.white,
          ),
          title: Text(
            "Users",
            style: TextStyle(color: Colors.white),
          )),
      BubbleBottomBarItem(
          backgroundColor: color1,
          icon: Icon(
            Icons.article_outlined,
            color: color1,
          ),
          activeIcon: Icon(
            Icons.article,
            color: Colors.white,
          ),
          title: Text(
            "Post",
            style: TextStyle(color: Colors.white),
          )),
    ],
  );
}
