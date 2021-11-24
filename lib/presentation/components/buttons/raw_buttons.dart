import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';

class RawButton extends StatelessWidget{
  final String text;
  final onPressed;

  const RawButton(this.text,this.onPressed);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [
                basePink,
                darkPink
              ]
          ),
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: InkWell(
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                color: textWhite,
                fontSize: 24.0,
                fontFamily: 'JosefinSans-Bold',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          splashColor: basePurple,
          highlightColor: basePurple,
          onTap:onPressed),
    );
  }

}