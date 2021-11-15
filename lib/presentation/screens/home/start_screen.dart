import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sleep_sound/data/data.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/data/resources/images.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';
import 'package:sleep_sound/presentation/components/buttons/raw_buttons.dart';
import 'package:sleep_sound/presentation/components/filters/filter.dart';

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
  List data = [
    Data(habit: 'excersize', tag: 'wakeup', date: DateTime.now()),
    Data(habit: 'excersize', tag: 'morning', date: DateTime.now()),
    Data(habit: 'read', tag: 'wakeup', date: DateTime.now())
  ];
  List wakeUp = [];
  List morning = [];
  List noon = [];
  List evening = [];
  List beforeSleep = [];
  @override
  initState() {
    isSelected[0]=true;
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
      appBar: RawAppBar(title: 'home', addBtn: false),
      floatingActionButton: Padding(
          padding: const EdgeInsets.all(20),
          child: RawButton('add a new habit', ()=>Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: AddHabitScreen(),)))),
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
                                visible: wakeUp.isNotEmpty&&(isSelected[0]||isSelected[1]),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      child: Text('Wake up',
                                          style: _textStyle),
                                    ),
                                    for(int i=0;i<wakeUp.length;i++)RawCardStat(habit: wakeUp[i].habit)
                                  ],
                                )),
                            Visibility(
                              visible: morning.isNotEmpty&&(isSelected[0]||isSelected[2]),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 5),
                                    child:
                                    Text('Morning', style: _textStyle),
                                  ),
                                  for(int i=0;i<morning.length;i++)RawCardStat(habit: morning[i].habit)
                                ],
                              ),
                            ),
                            Visibility(
                              visible: noon.isNotEmpty&&(isSelected[0]||isSelected[3]),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 5),
                                    child: Text('Noon', style: _textStyle),
                                  ),
                                  for(int i=0;i<noon.length;i++)RawCardStat(habit: noon[i].habit)
                                ],
                              ),
                            ),
                            Visibility(
                              visible: evening.isNotEmpty&&(isSelected[0]||isSelected[4]),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 5),
                                    child:
                                    Text('Evening', style: _textStyle),
                                  ),
                                  for(int i=0;i<evening.length;i++)RawCardStat(habit: evening[i].habit)
                                ],
                              ),
                            ),
                            Visibility(
                                visible: beforeSleep.isNotEmpty&&(isSelected[0]||isSelected[5]),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      child: Text('Before sleep',
                                          style: _textStyle),
                                    ),
                                    for(int i=0;i<beforeSleep.length;i++)RawCardStat(habit: beforeSleep[i].habit)
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

  final TextStyle _textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontFamily: 'JoseFinSans-Light',
      fontWeight: FontWeight.w400);
}

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

class RawCardStat extends StatelessWidget {
  final String habit;

  const RawCardStat({Key? key, required this.habit}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const String path = 'assets/icons/';
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xCC210741).withOpacity(0.8),
              borderRadius: BorderRadius.circular(52)),
          child: Image.asset(
            path + habit + '.png',
            filterQuality: FilterQuality.high,
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '0 days/m',
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'JosefinSans-Thin',
                  color: Colors.white.withOpacity(0.5),
                  letterSpacing: -0.3),
            )
          ],
        ),
      ),
    );
  }
}
