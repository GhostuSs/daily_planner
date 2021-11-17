import 'package:flutter/material.dart';
import 'package:sleep_sound/data/data.dart';
import 'package:sleep_sound/data/list_habits.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';
import 'package:sleep_sound/presentation/components/calendar/raw_calendar.dart';
import 'package:sleep_sound/presentation/progress_bar/raw_progressbar.dart';
import 'package:provider/provider.dart';

class DescriptionScreen extends StatefulWidget {
  final String title;
  const DescriptionScreen({Key? key, required this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DescriptionScreen();
  }
}

class _DescriptionScreen extends State<DescriptionScreen> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  late List<DateTime> selectedEvents;

  @override
  initState(){
    selectedEvents=[];
    super.initState();
  }

  String reformatHabit(String habit) {
    String temp = '';
    switch (habit) {
      case 'excersize':
        {
          temp = 'Excersize';
          break;
        }
      case 'lesscaffeine':
        {
          temp = 'Less caffeine';
          break;
        }
      case 'drinkwater':
        {
          temp = 'Drink water';
          break;
        }
      case 'read':
        {
          temp = 'Read';
          break;
        }
      case 'brush':
        {
          temp = 'Brush&floss';
          break;
        }
      case 'eatfruits':
        {
          temp = 'Eat fruits';
          break;
        }
      case 'fallasleepearly':
        {
          temp = 'Fall asleep early';
          break;
        }
      case 'wakeearly':
        {
          temp = 'Wake early';
          break;
        }
      case 'stretch':
        {
          temp = 'Stretch';
          break;
        }
      case 'takeashower':
        {
          temp = 'Take a shower';
          break;
        }
    }
    return temp;
  }
  double value = 0.15;
  @override
  Widget build(BuildContext context) {
    print(selectedEvents);
    return Scaffold(
        appBar: RawAppBar(title: reformatHabit(widget.title), addBtn: false),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(gradient: customGradient),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'your habits'.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'JosefinSans-Light',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                RawCalendar(selectedDay: selectedDay, focusedDay: focusedDay, selectedEvents: selectedEvents),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text(
                        'Progression',
                        style: TextStyle(
                          color: textWhite.withOpacity(0.9),
                          fontSize: 24,
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'JosefinSans-Thin',
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ProgressBar(value: value)
              ],
            )));
  }
}

enum Direction { left, right }

class CustomChevron extends StatelessWidget {
  final Direction direction;
  CustomChevron({required this.direction});
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(stops: const [
        0.0,
        0.31,
        1.0
      ], colors: [
        const Color(0xFFFFCACF).withOpacity(0.95),
        const Color(0xFFFEA7AF).withOpacity(0.95),
        const Color(0xFFF862BD).withOpacity(0.95)
      ]).createShader(bounds),
      child: Icon(
        direction == Direction.left ? Icons.chevron_left : Icons.chevron_right,
      ),
    );
  }
}



