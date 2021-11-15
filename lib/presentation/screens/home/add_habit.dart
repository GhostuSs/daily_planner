import 'package:flutter/material.dart';
import 'package:sleep_sound/data/data.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';
import 'package:sleep_sound/presentation/components/buttons/raw_buttons.dart';
import 'package:sleep_sound/presentation/components/cards/habit_card.dart';
import 'package:sleep_sound/presentation/components/rows/raw_row.dart';
import 'package:sleep_sound/presentation/components/text_field/raw_textfield.dart';

class AddHabitScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddHabitScreenState();
  }
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  var textFieldController = TextEditingController();
  String month = '';
  int daysInMonth = 0;
  int today = 0;
  List<bool> selectedDate = List.generate(5, (index) => false);
  List data = [
    Data(habit: 'brush', tag: 'wakeup', date: DateTime.now()),
    Data(habit: 'drinkwater', tag: 'wakeup', date: DateTime.now()),
    Data(habit: 'wakeearly', tag: 'wakeup', date: DateTime.now()),
    Data(habit: 'excersize', tag: 'morning', date: DateTime.now()),
    Data(habit: 'read', tag: 'morning', date: DateTime.now()),
    Data(habit: 'lesscaffeine', tag: 'morning', date: DateTime.now()),
    Data(habit: 'eatfruits', tag: 'noon', date: DateTime.now()),
    Data(habit: 'drinkwater', tag: 'noon', date: DateTime.now()),
    Data(habit: 'lesscaffeine', tag: 'noon', date: DateTime.now()),
    Data(habit: 'stretch', tag: 'evening', date: DateTime.now()),
    Data(habit: 'read', tag: 'evening', date: DateTime.now()),
    Data(habit: 'takeashower', tag: 'evening', date: DateTime.now()),
    Data(habit: 'drinkwater', tag: 'beforesleep', date: DateTime.now()),
    Data(habit: 'takeashower', tag: 'beforesleep', date: DateTime.now()),
  ];
  List wakeUp = [];
  List morning = [];
  List noon = [];
  List evening = [];
  List beforeSleep = [];
  var _textFieldController = TextEditingController();

  @override
  initState() {
    print(DateTime.now());
    print(data.length);
    for (int i = 0; i < data.length; i++) {
      switch (data[i].tag) {
        case 'wakeup':
          {
            wakeUp.add(data[i]);
            break;
          }
        case 'morning':
          {
            morning.add(data[i]);
            break;
          }
        case 'noon':
          {
            noon.add(data[i]);
            break;
          }
        case 'evening':
          {
            evening.add(data[i]);
            break;
          }
        case 'beforesleep':
          {
            beforeSleep.add(data[i]);
            break;
          }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RawAppBar(title: ' ', addBtn: false),
      floatingActionButton: Container(
        padding: EdgeInsets.all(20),
        child: RawButton(
            'DONE',
                (){}
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        decoration: const BoxDecoration(gradient: customGradient),
        child: data.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'pick up habits'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'JosefinSans-Light',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xCC210741).withOpacity(0.8)),
                    child: RawTextField(null, 'Create custom habit', null,
                        _textFieldController),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                                visible: wakeUp.isNotEmpty,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RawRow(
                                      onTap: _onTap,
                                      label: 'Wake up',
                                    ),
                                    Wrap(
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      alignment: WrapAlignment.center,
                                      children: [
                                        for (int i = 0; i < wakeUp.length; i++)
                                          HabitCard(habit: wakeUp[i].habit)
                                      ],
                                    )
                                  ],
                                )),
                            Visibility(
                              visible: morning.isNotEmpty,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RawRow(
                                    label: 'Morning',
                                    onTap: _onTap,
                                  ),
                                  Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      for (int i = 0; i < morning.length; i++)
                                        HabitCard(habit: morning[i].habit)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                              visible: noon.isNotEmpty,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RawRow(
                                    label: 'Noon',
                                    onTap: _onTap,
                                  ),
                                  Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      for (int i = 0; i < noon.length; i++)
                                        HabitCard(habit: noon[i].habit)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                              visible: evening.isNotEmpty,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RawRow(
                                    onTap: _onTap,
                                    label: 'Evening',
                                  ),
                                  Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      for (int i = 0; i < evening.length; i++)
                                        HabitCard(habit: evening[i].habit)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                                visible: beforeSleep.isNotEmpty,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RawRow(
                                        onTap: _onTap, label: 'Before sleep'),
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      children: [
                                        for (int i = 0;
                                            i < beforeSleep.length;
                                            i++)
                                          HabitCard(habit: beforeSleep[i].habit)
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            : const Text('is empty'),
      ),
    );
  }

  _onTap() => Navigator.pushNamed(context, '/');
  final TextStyle _textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontFamily: 'JoseFinSans-Light',
      fontWeight: FontWeight.w400,
      letterSpacing: -0.3);

  String textDay(int index) {
    String temp = '';
    switch (index) {
      case 0:
        {
          temp = 'Day before\nyesterday';
          break;
        }
      case 1:
        {
          temp = 'Yesterday';
          break;
        }
      case 2:
        {
          temp = 'Today';
          break;
        }
      case 3:
        {
          temp = 'Tommorow';
          break;
        }
      case 4:
        {
          temp = 'Day after\ntommorow';
          break;
        }
    }
    return temp;
  }
}
