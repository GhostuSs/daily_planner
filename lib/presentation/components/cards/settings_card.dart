import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';

Widget rawCard(String text,onPressed,IconData icon){
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
                  child: Icon(
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