import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RawRow extends StatelessWidget{
  final String label;
  final onTap;
  final TextStyle _textStyle=TextStyle(
      color: Colors.white.withOpacity(0.9),
      fontSize: 24,
      fontFamily: 'JoseFinSans-Light',
      fontWeight: FontWeight.w400,
      letterSpacing: -0.3
  );
  RawRow({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Text(label, style: _textStyle),
              const SizedBox(width: 5),
              Icon(
                  Icons.add_circle_outline,
                  color: Colors.white.withOpacity(0.7),
              )
            ]
        ),
      ),
    );
  }

}