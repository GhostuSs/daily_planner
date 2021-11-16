import 'package:flutter/material.dart';
import 'package:sleep_sound/data/data.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';
import 'package:sleep_sound/presentation/components/cards/habit_card.dart';
import 'package:sleep_sound/presentation/components/rows/raw_row.dart';
import 'package:sleep_sound/presentation/components/text_field/raw_textfield.dart';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _AddHabitScreenState();
  }
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  var textFieldController = TextEditingController();
  final List data = [
    Data(habit: 'brush', tag: 'wakeup', date: DateTime.now()),
    Data(habit: 'drinkwater', tag: 'wakeup', date: DateTime.now()),
    Data(habit: 'wakeearly', tag: 'wakeup', date: DateTime.now()),
    Data(habit: 'excersize', tag: 'data', date: DateTime.now()),
    Data(habit: 'read', tag: 'data', date: DateTime.now()),
    Data(habit: 'lesscaffeine', tag: 'data', date: DateTime.now()),
    Data(habit: 'eatfruits', tag: 'data', date: DateTime.now()),
    Data(habit: 'drinkwater', tag: 'data', date: DateTime.now()),
    Data(habit: 'lesscaffeine', tag: 'data', date: DateTime.now()),
    Data(habit: 'stretch', tag: 'data', date: DateTime.now()),
    Data(habit: 'read', tag: 'data', date: DateTime.now()),
    Data(habit: 'takeashower', tag: 'data', date: DateTime.now()),
    Data(habit: 'drinkwater', tag: 'beforesleep', date: DateTime.now()),
    Data(habit: 'takeashower', tag: 'beforesleep', date: DateTime.now()),
  ];
  List<bool> isSelected = [];
  var _textFieldController = TextEditingController();
  @override
  initState() {
    isSelected=List.generate(data.length, (index)=>false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RawAppBar(title: ' ', addBtn: false),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(20),
        child: DoneButton(
            'DONE',
                (){},
          isSelected
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
                        color: const Color(0xCC210741).withOpacity(0.8)),
                    child: RawTextField(null, 'Create custom habit', null,
                        _textFieldController),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                                visible: data.isNotEmpty,
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
                                        for (int i = 0; i < 3; i++)
                                          HabitCard(habit: data[i].habit,onTap: ()=>setState((){isSelected[i]=!isSelected[i];}), isSelected: isSelected[i],)
                                      ],
                                    )
                                  ],
                                )),
                            Visibility(
                              visible: data.isNotEmpty,
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
                                      for (int i = 3; i <6; i++)
                                        HabitCard(habit: data[i].habit,onTap: ()=>setState((){isSelected[i]=!isSelected[i];}), isSelected: isSelected[i],)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                              visible: data.isNotEmpty,
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
                                      for (int i = 6; i <=8; i++)
                                        HabitCard(habit: data[i].habit,onTap: ()=>setState((){isSelected[i]=!isSelected[i];}), isSelected: isSelected[i],)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                              visible: data.isNotEmpty,
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
                                      for (int i = 9; i <=11; i++)
                                        HabitCard(habit: data[i].habit,onTap: ()=>setState((){isSelected[i]=!isSelected[i];}), isSelected: isSelected[i],)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                                visible: data.isNotEmpty,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RawRow(
                                        onTap: _onTap, label: 'Before sleep'),
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment: WrapCrossAlignment.center,
                                      children: [
                                        for (int i = 12;
                                        i <=13;
                                        i++)
                                          HabitCard(habit: data[i].habit,onTap: ()=>setState((){isSelected[i]=!isSelected[i];}), isSelected: isSelected[i],)
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

class DoneButton extends StatelessWidget{
  final String text;
  final List<bool> isSelected;
  final onPressed;

  DoneButton(this.text,this.onPressed,this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
          gradient: isSelected.contains(true)
              ? const LinearGradient(
              colors: [
                basePink,
                darkPink
              ]
          )
              : LinearGradient(
            colors: [
              const Color(0xBEBEBE).withOpacity(0.95),
              const Color(0xBEBEBE).withOpacity(0.95)
            ]
          ),
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: InkWell(
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                color: textWhite,
                fontSize: 24.0,
                fontFamily: 'JosefinSans-Bold',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          splashColor: basePurple,
          highlightColor: basePurple,
          onTap:
          isSelected.contains(true)
          ? onPressed
              :(){}
      ),
    );
  }

}