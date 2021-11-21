import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';

class SliderTile extends StatelessWidget {
  final String  title, desc;
  Widget widget;
  final bool flag;
  SliderTile(
      {Key? key, required this.widget,
        required this.title,
        required this.desc,
        required this.flag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Align(
          alignment: Alignment.topLeft,
          child: flag
              ? Padding(
            padding: EdgeInsets.only(
                left: 40, top: height * 0.065),
            child: InkWell(
              onTap: ()=>Navigator.pushNamed(context, '/'),
              child: const SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  CupertinoIcons.clear,
                  color: Color(0xFF554469),
                  size: 24.0,
                ),
              ),
            ),
          )
              : const Text('')),
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: height*0.05),
            AspectRatio(
              aspectRatio: 19/9,
              child: widget,
            ),
            SizedBox(height: height*0.08),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                maxLines: 2,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    fontFamily: 'JosefinSans-Bold',
                    color: textWhite),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.014),
                child: Text(desc,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'JosefinSans-SemiBold',
                        color: textWhite))),
          ],
        ),
      ),
    ]);
  }
}