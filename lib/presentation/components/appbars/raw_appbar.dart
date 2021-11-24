import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/presentation/screens/home/add_habit.dart';

class RawAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool addBtn;
  final bool backBtn;
  const RawAppBar({Key? key, required this.title,required this.addBtn, required this.backBtn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: backBtn,
      shape: Border(
          bottom: BorderSide(color: textWhite.withOpacity(0.5), width: 0.5)),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: basePurple,
      title: Text(
        title.toUpperCase(),
        style: const TextStyle(
            color: textWhite, fontFamily: 'JosefinSans-Light', fontSize: 18),
      ),
      actions: [
        if(addBtn==true)Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
              splashColor: basePurple,
              highlightColor: basePurple,
              onPressed: ()=>Navigator.push(context, PageTransition(child: AddHabitScreen(), type: PageTransitionType.rightToLeft)),
              icon: const Icon(
                Icons.add_circle_outline_outlined,
                color: textWhite,
                size: 24,
              )

          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);

}
