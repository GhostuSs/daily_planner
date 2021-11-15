import 'package:flutter/material.dart';

class HabitCard extends StatelessWidget{
  final String imagePath='assets/icons/';
  final String habit;
  const HabitCard({Key? key, required this.habit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xCC210741).withOpacity(0.8)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath+habit+'.png'),
          const SizedBox(height: 5),
          Text(
              reformatHabit(habit),
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0
              )
          )
        ],
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
    }
    return temp;
  }

}