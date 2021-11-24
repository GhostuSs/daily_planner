import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/images.dart';

class RateMyApp extends StatelessWidget {
  const RateMyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _textStyle = TextStyle(
        color: CupertinoColors.systemBlue,
        fontSize: 15.0,
        fontFamily: 'JosefinSans-Bold',
        fontWeight: FontWeight.bold);
    return Theme(
        data: ThemeData.dark(),
        child: CupertinoAlertDialog(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    OnBoardingImages.appIcon,
                    width: 64,
                    filterQuality: FilterQuality.high,
                    height: 64,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  'Please rate the app',
                  style: TextStyle(
                      fontFamily: 'JosefinSans-Bold',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: textWhite),
                ),
              ),
            ],
          ),
          content: const Text(
            'Tap a star to rate. You can also leave a \ncomment ',
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            style: TextStyle(
                fontFamily: 'JosefinSans-Light',
                fontSize: 11,
                color: textWhite),
          ),
          actions: [
            CupertinoDialogAction(
                child: RatingBarIndicator(
              rating: 4.0,
              itemCount: 5,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.5),
                  child: Icon(
                    index == 4
                        ? Icons.star_border_outlined
                        : Icons.star_rounded,
                    size: 24.0,
                    color: CupertinoColors.systemBlue,
                  )),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      '        Cancel',
                      style: _textStyle,
                    )),
                Container(
                  width: 0.3,
                  color: Colors.white.withOpacity(0.3),
                  height: 50,
                ),
                CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Submit        ',
                      style: _textStyle,
                    ))
              ],
            )
          ],
        ));
  }
}
