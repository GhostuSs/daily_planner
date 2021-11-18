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
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: true,
      tabBar: btmNavBar(_selectedIndex),
      tabBuilder: (BuildContext context, _selectedIndex){
        return CupertinoTabView(
            builder:(context){
              switch(_selectedIndex){
                case 1: {
                  return new HabitsScreen();
                }
                case 2:{
                  return new TodayScreen();
                }
                case 3: {
                  return new SettingsScreen();
                }
                default:{
                  return new HabitsScreen();
                }
              }
            }
        );
      },
    );
  }

}