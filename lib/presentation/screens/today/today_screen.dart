import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';

class TodayScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TodayScreen();
  }
}

class _TodayScreen extends State<TodayScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: rawAppBar('today'),
      body: Container(
        decoration: const BoxDecoration(
          gradient: customGradient
        ),
        child: ListView(
            children: [Column(
              children: [
                Text('123')
              ],
            )]
        ),
      ),
    );
  }

}