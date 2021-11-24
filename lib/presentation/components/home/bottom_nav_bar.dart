// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';

CupertinoTabBar btmNavBar(int selectedIndex) {
  return CupertinoTabBar(
    backgroundColor: Color(0xFF10082D),
    activeColor: textWhite,
    inactiveColor: textWhite.withOpacity(0.4),
    currentIndex: selectedIndex,
    border: Border(top: BorderSide(width: 2,color: textWhite.withOpacity(0.25))),
    items: [
      BottomNavigationBarItem(
          icon: HomeButton(textWhite.withOpacity(0.4)),
          label: 'home'.toUpperCase(),
          activeIcon: HomeButton(textWhite)
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_outlined,color: textWhite.withOpacity(0.4),size: 25),
          label: 'today'.toUpperCase(),
          activeIcon: Icon(Icons.calendar_today_outlined,color: textWhite,size: 25)),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined,color: textWhite.withOpacity(0.4),size: 25),
          label: 'Settings'.toUpperCase(),
          activeIcon: Icon(Icons.settings_outlined,color: textWhite,size: 25)),
    ],
  );
}

class HomeButton extends StatelessWidget{
  final Color color;
  HomeButton(this.color);
  @override
  build(BuildContext context) {
    return Center(
      child: Container(
        width: 25,
        height: 25,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 3,
              height: 9,
              color: color,
            ),
            SizedBox(width: 2),
            Container(
              width: 3,
              height: 22.5,
              color: color,
            ),
            SizedBox(width: 2),
            Container(
              width: 3,
              height: 13.5,
              color: color,
            ),
            SizedBox(width: 2),
            Container(
              width: 3,
              height: 18.75,
              color: color,
            )
          ],
        ),
      ),
    );
  }
}
