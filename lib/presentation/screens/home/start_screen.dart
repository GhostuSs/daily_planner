import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/data/resources/images.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';
import 'package:sleep_sound/presentation/components/buttons/raw_buttons.dart';
List data = [];
class HabitsScreen extends StatefulWidget{
  const HabitsScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HabitsScreen();
  }
}

class _HabitsScreen extends State<HabitsScreen>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        child: Scaffold(
      appBar: rawAppBar('home'),
      floatingActionButton: Padding(
          padding: const EdgeInsets.all(20),
          child: RawButton('add a new habit', (){})
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        decoration: const BoxDecoration(
            gradient: customGradient
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            data.isNotEmpty
                ? const Text('123')
                :const EmptyDataWidget(),

          ],
        ),
      ),
    )
    );
  }

}

class EmptyDataWidget extends StatelessWidget{
  const EmptyDataWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Image.asset(
              AppImages.yoga,
            )
        ),
        const SizedBox(height: 20),
        Text(
          "You haven't added\nany habits yet",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textWhite.withOpacity(0.5),
          fontSize: 24,
          fontFamily: 'OpenSans-SemiBold',
          fontWeight: FontWeight.w400
        ),
        )
      ],
    );
  }

}