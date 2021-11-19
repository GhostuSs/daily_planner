import 'package:flutter/material.dart';

class CustomHabitCard extends StatelessWidget{
  final String imagePath='assets/icons/';
  final onTap;
  final bool isSelected;
  final String habit;
  const CustomHabitCard({Key? key, required this.habit, required this.onTap,required this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: 64,
          height: 64,
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