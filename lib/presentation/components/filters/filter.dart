import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  final String tag;
  bool isSelected=false;
  final onTap;
  Filter({Key? key, required this.tag,required this.isSelected,required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1,vertical: 3),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isSelected
                  ? const Color(0xCC210741).withOpacity(0.8)
                  :const Color(0x66210741).withOpacity(0.4)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            tag,
            style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.8),
                fontFamily: 'JosefinSans-Light',
                fontWeight: FontWeight.w300,
                letterSpacing: -0.3),
          ),
        ),
      ),
    );
  }
}