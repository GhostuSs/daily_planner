import 'package:flutter/material.dart';

class DayCard extends StatelessWidget{
  final onTap;
  final bool isSelected;
  final String day;
  const DayCard({Key? key, required this.day, required this.onTap,required this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
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
              Text(
                day,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 16,
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