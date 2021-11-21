import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sound/data/list_habits.dart';
import 'package:sleep_sound/data/pickup_habits.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';
import 'package:sleep_sound/presentation/components/cards/habit_card.dart';
import 'package:sleep_sound/presentation/components/rows/raw_row.dart';
import 'package:sleep_sound/presentation/components/text_field/raw_textfield.dart';

import 'add_custom_habit.dart';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _AddHabitScreenState();
  }
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  var textFieldController = TextEditingController();

  List<bool> isSelected = [];
  final TextEditingController _textFieldController = TextEditingController();
  @override
  initState() {
    isSelected = List.generate(context.read<PickUpHabits>().data.length, (index) => false);
    super.initState();
  }

  _onPressed() {
    for (int i = 0; i < context.read<PickUpHabits>().data.length; i++) {
      if (isSelected[i] == true) {
        context.read<ListHabits>().listHabits.add(context.read<PickUpHabits>().data[i]);
      }
    }
    Navigator.popAndPushNamed(context,'/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RawAppBar(title: ' ', addBtn: false,backBtn: true,),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(20),
        child: DoneButton('DONE', _onPressed, isSelected),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        decoration: const BoxDecoration(gradient: customGradient),
        child: context.read<PickUpHabits>().data.isNotEmpty
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
                                visible: context.read<PickUpHabits>().data.isNotEmpty,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RawRow(
                                      onTap: ()=>Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,child: const AddCustomHabitScreen())),
                                      label: 'Wake up',
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      alignment: WrapAlignment.center,
                                      children: [
                                        for (int i = 0; i < 3; i++)
                                          HabitCard(
                                            habit: context.read<PickUpHabits>().data[i].habit!,
                                            onTap: () => setState(() {
                                              isSelected[i] = !isSelected[i];
                                            }),
                                            isSelected: isSelected[i],
                                          )
                                      ],
                                    )
                                  ],
                                )),
                            Visibility(
                              visible: context.read<PickUpHabits>().data.isNotEmpty,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RawRow(
                                    label: 'Morning',
                                    onTap: ()=>Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,child: const AddCustomHabitScreen())),
                                  ),
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      for (int i = 3; i < 6; i++)
                                        HabitCard(
                                          habit: context.read<PickUpHabits>().data[i].habit!,
                                          onTap: () => setState(() {
                                            isSelected[i] = !isSelected[i];
                                          }),
                                          isSelected: isSelected[i],
                                        )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                              visible: context.read<PickUpHabits>().data.isNotEmpty,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RawRow(
                                    label: 'Noon',
                                    onTap: ()=>Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,child: const AddCustomHabitScreen())),
                                  ),
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      for (int i = 6; i <= 8; i++)
                                        HabitCard(
                                          habit: context.read<PickUpHabits>().data[i].habit!,
                                          onTap: () => setState(() {
                                            isSelected[i] = !isSelected[i];
                                          }),
                                          isSelected: isSelected[i],
                                        )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                              visible: context.read<PickUpHabits>().data.isNotEmpty,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RawRow(
                                    onTap: ()=>Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,child: const AddCustomHabitScreen())),
                                    label: 'Evening',
                                  ),
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      for (int i = 9; i <= 11; i++)
                                        HabitCard(
                                          habit: context.read<PickUpHabits>().data[i].habit!,
                                          onTap: () => setState(() {
                                            isSelected[i] = !isSelected[i];
                                          }),
                                          isSelected: isSelected[i],
                                        )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                                visible: context.read<PickUpHabits>().data.isNotEmpty,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RawRow(
                                        onTap: ()=>Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,child: const AddCustomHabitScreen())), label: 'Before sleep'),
                                    Wrap(
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        for (int i = 12; i <= 13; i++)
                                          HabitCard(
                                            habit: context.read<PickUpHabits>().data[i].habit!,
                                            onTap: () => setState(() {
                                              isSelected[i] = !isSelected[i];
                                            }),
                                            isSelected: isSelected[i],
                                          )
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

class DoneButton extends StatelessWidget {
  final String text;
  final List<bool> isSelected;
  final onPressed;

  const DoneButton(this.text, this.onPressed, this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
          gradient: isSelected.contains(true)
              ? const LinearGradient(colors: [basePink, darkPink])
              : LinearGradient(colors: [
                  const Color(0xFFBEBEBE).withOpacity(0.95),
                  const Color(0xFFBEBEBE).withOpacity(0.95)
                ]),
          borderRadius: BorderRadius.circular(8.0)),
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
          onTap: isSelected.contains(true) ? onPressed : () {}),
    );
  }
}
