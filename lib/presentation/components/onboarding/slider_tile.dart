import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';

class SliderTile extends StatelessWidget {
  final String  title, desc;
  final int index;
  final Widget widget;
  final bool flag;
  const SliderTile(
      {Key? key, required this.widget,
        required this.title,
        required this.desc,
        required this.flag, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    print(height);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Align(
          alignment: Alignment.topLeft,
          child: flag
              ? Padding(
            padding: EdgeInsets.only(
                left: 20, top: height*0.06),
            child: InkWell(
              onTap: ()=>Navigator.pushNamed(context, '/'),
              child: const SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  CupertinoIcons.clear,
                  color: Color(0xFF554469),
                  size: 30.0,
                ),
              ),
            ),
          )
              : Padding(
            padding: EdgeInsets.only(top: height*0.09),
            child: Text(''),
          )),
          SizedBox(height:height*0.01),
      height>700 ? SizedBox(height: height*0.1,):Text(''),
      Center(
        child: Column(
          children: [
            flag ? Text('') :SizedBox(height: height*0.03),
            widget,
            SizedBox(height: height*0.035),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: height*0.034,
                    fontFamily: 'JosefinSans-Bold',
                    color: textWhite),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.014),
                child: Text(desc,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: height*0.03,
                        fontFamily: 'JosefinSans-SemiBold',
                        color: textWhite))),
          ],
        ),
      ),
    ]);
  }
}