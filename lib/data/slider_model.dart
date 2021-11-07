// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/images.dart';

class SliderModel{
  Widget widget;
  String title;
  String desc;

  SliderModel({required this.widget,required this.title,required this.desc});
}

List<SliderModel> getSlides(){
  List<SliderModel> slides = List.empty(growable: true);
  slides.add(SliderModel(
      widget: Picture(OnBoardingImages.choose),
      title: 'choose\nthe habits',
      desc: "Choose the habits you want to track and\nwe'll make sure you won't forget about them"));
  slides.add(SliderModel(
      widget: Review(),
      title: 'Help us to\nimprove the app',
      desc: 'We constantly monitor feedback and\nlisten to your opinion'));
  slides.add(SliderModel(
      widget: Picture(OnBoardingImages.customHab),
      title: 'Add custom habits',
      desc: 'We have a predefined set of habits, but you\ncan always create your own'));
  slides.add(SliderModel(
      widget: Picture(OnBoardingImages.progress),
      title: 'watch the progress',
      desc: 'Subscribe to unlock all the features,\njust '+r'$'+'3.99/w '));
  return slides;
}

class Review extends StatelessWidget{
  const Review({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          decoration: BoxDecoration(
            color: Color(0xFF210741),
              borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.asset(OnBoardingImages.avatar),
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      children:[for(int i=0;i<6;i++)const Padding(padding: EdgeInsets.symmetric(horizontal: 1),child: Icon(CupertinoIcons.star_fill,color: Color(0xCCFFCC00)),)]
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "I so want to cultivate good habits, drink plenty of water, eat fruits and vegetables, and sometimes I even forget to brush my teeth. But with this app I don't forget about anything, incredibly convenient!",
                style: TextStyle(
                  color: textWhite.withOpacity(0.9),
                    fontFamily: 'JosefinSans-Light',
                    fontSize: 16,
                    letterSpacing: 1,
                    
                    fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(height: 10),
              Text(
                'By John',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: textWhite.withOpacity(0.5),
                  fontFamily: 'JosefinSans-Light'
                ),
              )

            ],
          ),
        )
    );
  }
}

class Picture extends StatelessWidget{
  final name;
  Picture(this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child:AspectRatio(
            aspectRatio: 2/1.2,
            child: Center(child: Image.asset(name),
            )
        ));
  }
}