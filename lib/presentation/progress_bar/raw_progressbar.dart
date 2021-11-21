import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';

class ProgressBar extends StatelessWidget{
  ProgressBar({required this.value});
  final double value;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          padding: const EdgeInsets.only(left: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.all(const Radius.circular(16)),
            child: LinearProgressIndicator(
              minHeight: 32,
              color: const Color(0xCC210741),
              backgroundColor:
              const Color(0xCC210741).withOpacity(0.8),
              valueColor: AlwaysStoppedAnimation<Color>(
                  const Color(0xFFFEA7AF).withOpacity(0.95)),
              value: value,
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.1),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            '${(value * 100).round()} %',
            style: TextStyle(
              color: textWhite.withOpacity(0.8),
              fontFamily: 'JosefinSans-Light',
              fontWeight: FontWeight.w300,
              fontSize: 16.0,
              letterSpacing: -0.3,
            ),
          ),
        )
      ],
    );
  }

}