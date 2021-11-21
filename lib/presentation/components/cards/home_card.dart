import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sleep_sound/data/data.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/presentation/screens/home/description.dart';

class HomeCard extends StatelessWidget {
  final Data data;

  const HomeCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String path = 'assets/icons/';
    return InkWell(
      onTap: () =>
          Navigator.push(context, PageTransition(
              type: PageTransitionType.rightToLeft,
              child: DescriptionScreen(data: data))),
      splashColor: darkPink,
      highlightColor: darkPink,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xCC210741).withOpacity(0.8),
                borderRadius: BorderRadius.circular(52)),
            child: Image.asset(
              path + data.habit! + '.png',
              filterQuality: FilterQuality.high,
            ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                quantityOfRepeatings(data),
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
      ),
    );
  }
  String quantityOfRepeatings(Data data){
    switch(data.repeat){
      case Repeating.monthly:{
        return '${data.dates?.length.toString() ?? '0'} days/m';
      }
      case Repeating.weekly:{
        return  '${data.dates?.length.toString() ?? '0'} days/m';
      }
      case Repeating.daily:{
        return 'Everyday';
      }
      default:{
        return 'Everyday';
      }
    }

  }
}

