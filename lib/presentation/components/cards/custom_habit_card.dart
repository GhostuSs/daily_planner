import 'package:flutter/material.dart';

class CustomHabitCard extends StatelessWidget{
  final String imagePath='assets/icons/';
  final onTap;
  final bool isSelected;
  final String habit;
  const CustomHabitCard({Key? key, required this.habit, required this.onTap,required this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    print('width $width');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width>350 ? width*0.015 : width*0.01,vertical: width*0.015),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          width: height>895? height*0.07 : height*0.08,
          height: height>895? height*0.07 : height*0.08,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xCC210741).withOpacity(0.8),
              border: Border.all(
                  color: isSelected
                      ? Colors.white.withOpacity(0.5)
                      : const Color(0xCC210741).withOpacity(0.8)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(imagePath+habit+'.png',filterQuality: FilterQuality.high),
            ],
          ),
        ),
      ),
    );
  }
}