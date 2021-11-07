import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';

PreferredSizeWidget rawAppBar(String title){
  return AppBar(
    shape: Border(
        bottom: BorderSide(color: textWhite.withOpacity(0.5), width: 0.5)),
    centerTitle: true,
    elevation: 0.0,
    backgroundColor: basePurple,
    title: Text(
      title.toUpperCase(),
      style: const TextStyle(
          color: textWhite, fontFamily: 'JosefinSans-Light', fontSize: 18),
    ),
  );
}
