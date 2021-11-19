import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';

class RawAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool addBtn;
  const RawAppBar({Key? key, required this.title,required this.addBtn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              onPressed: (){},
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
