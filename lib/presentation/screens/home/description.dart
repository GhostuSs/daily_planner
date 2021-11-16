import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';


class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DescriptionScreen();
  }
}

class _DescriptionScreen extends State<DescriptionScreen> {

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: RawAppBar(title: 'excersize', addBtn: false),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: customGradient),
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'your habits'.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'JosefinSans-Light',
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        )
      )
    );
  }
}
