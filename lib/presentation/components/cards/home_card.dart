import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String habit;

  const HomeCard({Key? key, required this.habit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String path = 'assets/icons/';
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xCC210741).withOpacity(0.8),
              borderRadius: BorderRadius.circular(52)),
          child: Image.asset(
            path + habit + '.png',
            filterQuality: FilterQuality.high,
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '0 days/m',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'JosefinSans-Thin',
                  color: Colors.white.withOpacity(0.5),
                  letterSpacing: -0.3),
            )
          ],
        ),
      ),
    );
  }
}