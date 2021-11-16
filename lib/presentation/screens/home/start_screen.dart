import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sound/data/list_habits.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';
import 'package:sleep_sound/presentation/components/buttons/raw_buttons.dart';
import 'package:sleep_sound/presentation/components/cards/home_card.dart';
import 'package:sleep_sound/presentation/components/filters/filter.dart';
import 'package:sleep_sound/presentation/components/home/empty_data.dart';
import 'package:sleep_sound/presentation/components/labels/home_label.dart';

import 'add_habit.dart';

List<String> tags = [
  'View all',
  'Wake up',
  'Morning',
  'Noon',
  'Evening',
  'Before sleep',
];
List<bool> isSelected = List.generate(tags.length, (index) => false);

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HabitsScreen();
  }
}

class _HabitsScreen extends State<HabitsScreen> {
  List data = [];

  @override
  initState() {
    isSelected[0] = true;
    data = context.read<ListHabits>().listHabits;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isSelected.contains(true) == false) isSelected[0] = true;
    data = context.read<ListHabits>().listHabits;
    return Scaffold(
      appBar: RawAppBar(title: 'home', addBtn: false),
      floatingActionButton: Padding(
          padding: const EdgeInsets.all(20),
          child: RawButton(
              'add a new habit',
              () => Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const AddHabitScreen(),
                  )))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: customGradient),
        child: data.isNotEmpty
            ? Column(
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
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      children: [
                        for (int i = 0; i < tags.length; i++)
                          Filter(
                              tag: tags[i],
                              isSelected: isSelected[i],
                              onTap: () => setState(() {
                                    switch (i) {
                                      case 0:
                                        {
                                          isSelected = List.generate(
                                              tags.length, (index) => false);
                                          isSelected[i] = true;
                                          break;
                                        }
                                      default:
                                        {
                                          isSelected[0] = false;
                                          isSelected[i] = !isSelected[i];
                                          break;
                                        }
                                    }
                                  }))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                                visible: data.isNotEmpty &&
                                    (isSelected[0] || isSelected[1]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const PartOfDayLabel(label: 'Wake up'),
                                    for (int i = 0; i < data.length; i++)
                                      if (data[i].tag == 'wakeup')
                                        HomeCard(habit: data[i].habit)
                                  ],
                                )),
                            Visibility(
                              visible: data.isNotEmpty &&
                                  (isSelected[0] || isSelected[2]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const PartOfDayLabel(label: 'Morning'),
                                  for (int i = 0; i < data.length; i++)
                                    if (data[i].tag == 'morning')
                                      HomeCard(habit: data[i].habit)
                                ],
                              ),
                            ),
                            Visibility(
                              visible: data.isNotEmpty &&
                                  (isSelected[0] || isSelected[3]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const PartOfDayLabel(label: 'Noon'),
                                  for (int i = 0; i < data.length; i++)
                                    if (data[i].tag == 'noon')
                                      HomeCard(habit: data[i].habit)
                                ],
                              ),
                            ),
                            Visibility(
                              visible: data.isNotEmpty &&
                                  (isSelected[0] || isSelected[4]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const PartOfDayLabel(label: 'Evening'),
                                  for (int i = 0; i < data.length; i++)
                                    if (data[i].tag == 'evening')
                                      HomeCard(habit: data[i].habit)
                                ],
                              ),
                            ),
                            Visibility(
                                visible: data.isNotEmpty &&
                                    (isSelected[0] || isSelected[5]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const PartOfDayLabel(label: 'Before sleep'),
                                    for (int i = 0; i < data.length; i++)
                                      if (data[i].tag == 'beforesleep')
                                        HomeCard(habit: data[i].habit)
                                  ],
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [EmptyDataWidget()],
              ),
      ),
    );
  }
}
