import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget{
  final String imagePath='assets/icons/';
  final onTap;
  bool isSelected;
  final String habit;
  HabitCard({Key? key, required this.habit, required this.onTap,required this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: 116,
          height: 104,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xCC210741).withOpacity(0.8),
              border: Border.all(
                  color: isSelected
                  ? Colors.white.withOpacity(0.5)
                  : const Color(0xCC210741).withOpacity(0.8)
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath+habit+'.png',scale: 0.9,filterQuality: FilterQuality.high),
              const SizedBox(height: 10),
              Text(
                  reformatHabit(habit),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w300,
                      fontFamily: 'JosefinSans-Thin',
                      fontSize: 14.0
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  String reformatHabit(String habit){
    String temp='';
    switch(habit){
      case 'excersize':{
        temp='Excersize';
        break;
      }
      case 'lesscaffeine':{
        temp='Less caffeine';
        break;
      }
      case 'drinkwater':{
        temp='Drink water';
        break;
      }
      case 'read':{
        temp='Read';
        break;
      }
      case 'brush':{
        temp='Brush&floss';
        break;
      }
      case 'eatfruits':{
        temp='Eat fruits';
        break;
      }
      case 'fallasleepearly':{
        temp='Fall asleep early';
        break;
      }
      case 'wakeearly':{
        temp='Wake early';
        break;
      }
      case 'stretch':{
        temp='Stretch';
        break;
      }
      case 'takeashower':{
        temp='Take a shower';
        break;
      }
    }
    return temp;
  }

}