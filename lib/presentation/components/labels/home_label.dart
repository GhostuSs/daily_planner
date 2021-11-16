import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartOfDayLabel extends StatelessWidget{

  final String label;
  const PartOfDayLabel({required this.label});
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontFamily: 'JoseFinSans-Light',
      fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 5),
      child: Text(label,
          style: _textStyle),
    );
  }

}