import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_sound/presentation/components/home/bottom_nav_bar.dart';
import 'package:sleep_sound/presentation/screens/home/start_screen.dart';
import 'package:sleep_sound/presentation/screens/settings/settings.dart';
import 'package:sleep_sound/presentation/screens/today/today_screen.dart';

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage>{
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: true,
      tabBar: btmNavBar(selectedIndex),
      tabBuilder: (BuildContext context, _selectedIndex){
        List pages = [
          const HabitsScreen(),
          TodayScreen(),
          const SettingsScreen(),
        ];
        return CupertinoTabView(
            builder:(context){
              return pages[_selectedIndex];
            }
        );
      },
    );
  }

}