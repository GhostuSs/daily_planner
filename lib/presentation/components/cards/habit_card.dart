import 'package:flutter/material.dart';
import 'package:sleep_sound/data/data.dart';

class HabitCard extends StatelessWidget{
  final String imagePath='assets/icons/';
  final onTap;
  bool isSelected;
  final Data data;
  HabitCard({Key? key, required this.onTap,required this.isSelected, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(width);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: width*0.28,
          height: height*0.12,
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
              Image.asset(imagePath+data.habit!+'.png',scale: 0.9,filterQuality: FilterQuality.high),
              SizedBox(height: height*0.01),
              Text(
                  reformatHabit(data),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w300,
                      fontFamily: 'JosefinSans-Thin',
                      fontSize: height*0.016
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  String reformatHabit(Data data){
    String temp='';
    switch(data.habit){
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
      default:{
        temp=data.name ?? 'Unknown';
      }
    }
    return temp;
  }

}