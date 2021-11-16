import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/images.dart';

class EmptyDataWidget extends StatelessWidget {
  const EmptyDataWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Image.asset(
              AppImages.yoga,
            )),
        const SizedBox(height: 20),
        Text(
          "You haven't added\nany habits yet",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textWhite.withOpacity(0.5),
              fontSize: 24,
              fontFamily: 'OpenSans-SemiBold',
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}