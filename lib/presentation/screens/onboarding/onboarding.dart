import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/data/slider_model.dart';
import 'package:sleep_sound/presentation/components/buttons/raw_buttons.dart';
import 'package:sleep_sound/presentation/components/onboarding/rating_dialog.dart';
import 'package:sleep_sound/presentation/components/onboarding/slider_tile.dart';

class OnBoardingScreen extends StatefulWidget{
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OnBoardingScreen();
  }

}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  List<SliderModel> slides = List.empty(growable: true);
  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: basePurple,
      body: Container(
        decoration: const BoxDecoration(
          gradient: customGradient
        ),
        child: PageView.builder(
            controller: pageController,
            itemCount: slides.length,
            onPageChanged: (val)=>setState((){currentIndex=val;}),
            itemBuilder: (context,index){
              return SliderTile(
                flag: index ==slides.length-1 ? true : false,
                widget: slides[index].widget,
                title: slides[index].title,
                desc: slides[index].desc,
              );
            }
        ),
      ),
      floatingActionButton: currentIndex==slides.length-1
          ?floatingBtm('Continue',()=>Navigator.pushNamed(context, '/'))
          :floatingBtm('Continue',onContinue),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  Future<void> onContinue() async {
    if (currentIndex==1) await showDialog(context: context,builder: (context)=>const RateMyApp());
    setState(() {
      currentIndex++;
      pageController.animateToPage(
          currentIndex, duration: const Duration(milliseconds: 300),
          curve: Curves.linear);
    });
  }
  void onStartFree(){
    Navigator.pushNamed(context, '/');
  }
  Widget floatingBtm(String text,onPressed){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0,top:10.0),
          child: RawButton(
            'continue',
            onPressed
          ),
        ),
        const SizedBox(height: 10),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: const Text(
                  'Privacy Policy',
                  style: TextStyle(
                      color: Color(0xFF554469),
                      fontFamily: 'JosefinSans-Light',
                      fontSize: 12.0
                  ),
                ),
                onTap: ()=>{},
              ),
              const SizedBox(width: 40),
              InkWell(
                child: const Text(
                  'Restore',
                  style: TextStyle(
                      color: Color(0xFF554469),
                      fontFamily: 'JosefinSans-Light',
                      fontSize: 12.0
                  ),
                ),
                onTap: ()=>{},
              ),
              const SizedBox(width: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  child: const Text(
                    'Terms of Use',
                    style: TextStyle(
                        color: Color(0xFF554469),
                        fontFamily: 'JosefinSans-Light',
                        fontSize: 12.0
                    ),
                  ),
                  onTap: ()=>{},
                ),
              )
            ]
        ),
        SizedBox(height:MediaQuery.of(context).size.height*0.02)
      ],
    );
  }
}
