import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';

class RawCard extends StatelessWidget{
  final String text;
  final onPressed;
  final IconData icon;
const RawCard({required this.text, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          splashColor: const Color(0xCC210741).withOpacity(0.8),
          highlightColor:const Color(0xCC210741).withOpacity(0.8),
          child: Container(
            width: double.infinity,
            height: 65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xCC210741).withOpacity(0.8)
            ),
            child: Card(
              color: const Color(0xCC210741).withOpacity(0.8),
              elevation: 30.0,
              shadowColor: basePurple.withOpacity(0.3),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 20,right: 15),
                      child: icon==Icons.share_rounded
                          ? Container(
                        padding: EdgeInsets.all(1),
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: textWhite.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(3)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(
                            icon,
                            color: Color(0xCC210741).withOpacity(0.8),
                            size: 22,
                          )],
                        ),
                      )
                          : Icon(
                        icon,
                        color: textWhite.withOpacity(0.9),
                        size: 24,
                      )
                  ),
                  Text(
                      text,
                      style: TextStyle(
                          color: textWhite.withOpacity(0.9),
                          fontWeight: FontWeight.w500,
                          fontSize: 24.0,
                          fontFamily: 'JosefinSans-SemiBold'
                      )
                  ),
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: textWhite.withOpacity(0.9),
                      )
                  )
                ],
              ),
            ),
          ),
          onTap: onPressed,
        )
    );
  }

}