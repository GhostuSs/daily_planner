import 'package:flutter/material.dart';

class DaysMonthCard extends StatelessWidget{
  final onTap;
  bool isSelected;
  final String day;
  DaysMonthCard({Key? key, required this.day, required this.onTap,required this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: TextStyle(
                    color: isSelected ? Colors.white.withOpacity(0.9) : Colors.white.withOpacity(0.5),
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -0.3
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}