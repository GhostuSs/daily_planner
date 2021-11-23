import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';
import 'package:sleep_sound/presentation/components/cards/settings_card.dart';

class SettingsScreen extends StatefulWidget{
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingsScreen();
  }
}

class _SettingsScreen extends State<SettingsScreen>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        child: Scaffold(
      backgroundColor: textWhite,
      appBar: const RawAppBar(title: 'settings',addBtn: false,backBtn: false,),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        decoration: const BoxDecoration(
          gradient: customGradient
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RawCard(text: 'Share',onPressed: (){},icon:Icons.share_rounded),
            RawCard(text: 'Privacy policy',onPressed: (){},icon:Icons.check_circle),
            RawCard(text:'Terms of use',onPressed:(){},icon:Icons.info),
            RawCard(text:'Support',onPressed:(){},icon:Icons.help),
          ],
        ),
      ),
    )
    );
  }

}