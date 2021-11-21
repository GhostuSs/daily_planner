import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sleep_sound/data/data.dart';
import 'package:sleep_sound/data/list_habits.dart';
import 'package:sleep_sound/data/pickup_habits.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';
import 'package:sleep_sound/presentation/components/cards/custom_habit_card.dart';
import 'package:sleep_sound/presentation/components/cards/day_card.dart';
import 'package:sleep_sound/presentation/components/cards/month_days_card.dart';
import 'package:sleep_sound/presentation/components/text_field/raw_textfield.dart';

class AddCustomHabitScreen extends StatefulWidget {
  const AddCustomHabitScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddCustomHabitScreenState();
  }
}

class _AddCustomHabitScreenState extends State<AddCustomHabitScreen> {
  Data inputData = Data(dates: []);
  List<bool> isSelectedHabit = [];
  List<bool> isSelectedTime = [];
  int repeating = 0;
  static const List<String> timeOfDay = [
    'Wake up',
    'Morning',
    'Noon',
    'Evening',
    'Before sleep'
  ];
  final _textFieldController = TextEditingController();

  @override
  initState() {
    isSelectedTime = List.generate(5, (index) => false);
    isSelectedHabit = List.generate(15, (index) => false);
    super.initState();
  }

  _onPressed() {
    for (int i = 0; i < 15; i++) {
      if (isSelectedHabit[i] == true) {
        inputData = Data(
            name: _textFieldController.text,
            habit: context.read<PickUpHabits>().customHabitData[i].habit,
            tag: reformatTimeOfDay(timeOfDay[isSelectedTime.indexOf(true)]),
            repeat: periodic(repeating),
            dates: inputData.dates);
        context.read<ListHabits>().listHabits.add(inputData);
      }
    }
    Navigator.popAndPushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    print(periodic(repeating));
    return Scaffold(
      appBar: const RawAppBar(title: ' ', addBtn: false, backBtn: true),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(20),
        child: DoneButton('DONE', _onPressed, isSelectedHabit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        decoration: const BoxDecoration(gradient: customGradient),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'new habit'.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'JosefinSans-Light',
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Habit name',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontFamily: 'JosefinSans-Light',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        letterSpacing: -0.3),
                  )
                ],
              ),
            ),
            Container(
              height: 48,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xCC210741).withOpacity(0.8)),
              child: RawTextField(null, '', null, _textFieldController),
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
                              Row(
                                children: [
                                  const SizedBox(width: 20),
                                  Text(
                                    'Pick up an icon and color',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'JosefinSans-Light',
                                        letterSpacing: -0.3,
                                        fontSize: 24.0),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    for (int i = 0; i < 15; i++)
                                      CustomHabitCard(
                                        habit: context
                                            .read<PickUpHabits>()
                                            .customHabitData[i]
                                            .habit!,
                                        onTap: () => setState(() {
                                          isSelectedHabit = List.generate(
                                              15, (index) => false);
                                          isSelectedHabit[i] =
                                              !isSelectedHabit[i];
                                        }),
                                        isSelected: isSelectedHabit[i],
                                      ),
                                  ],
                                ),
                              )
                            ],
                          )),
                      Visibility(
                          visible: context
                              .read<PickUpHabits>()
                              .customHabitData
                              .isNotEmpty,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 20),
                                  Text(
                                    'Which time in a day?',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'JosefinSans-Light',
                                        letterSpacing: -0.3,
                                        fontSize: 24.0),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    for (int i = 0; i < timeOfDay.length; i++)
                                      CustomHabitIcon(
                                          isSelectedTime: isSelectedTime[i],
                                          text: timeOfDay[i],
                                          onTap: () => setState(() {
                                                isSelectedTime = List.generate(
                                                    timeOfDay.length,
                                                    (index) => false);
                                                isSelectedTime[i] =
                                                    !isSelectedTime[i];
                                              }))
                                  ],
                                ),
                              )
                            ],
                          )),
                      Visibility(
                          visible: context.read<PickUpHabits>().data.isNotEmpty,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(width: 20),
                                  Text(
                                    'Repeat',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'JosefinSans-Light',
                                        letterSpacing: -0.3,
                                        fontSize: 24.0),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: CupertinoSlidingSegmentedControl(
                                        groupValue: repeating,
                                        backgroundColor: Color(0xFF99210741),
                                        thumbColor: Color(0xFF290753),
                                        children: <int, Widget>{
                                          0: Tab(
                                              label: 'Daily',
                                              index: 0,
                                              isSelectedIndex: repeating),
                                          1: Tab(
                                              label: 'Weekly',
                                              index: 1,
                                              isSelectedIndex: repeating),
                                          2: Tab(
                                              label: 'Monthly',
                                              index: 2,
                                              isSelectedIndex: repeating),
                                        },
                                        onValueChanged: (int? value) {
                                          setState(() {
                                            repeating = value!;
                                          });
                                        }),
                                  ),
                                  const SizedBox(height: 20),
                                  WidgetGenerator(
                                    selector: repeating,
                                    inputData: inputData,
                                  )
                                ],
                              )
                            ],
                          )),
                      const SizedBox(height: 150)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
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

class CustomHabitIcon extends StatelessWidget {
  final bool isSelectedTime;
  final String text;
  final onTap;
  CustomHabitIcon(
      {required this.isSelectedTime, required this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
              color: const Color(0xCC210741).withOpacity(0.8),
              border: Border.all(
                  color: isSelectedTime
                      ? Colors.white.withOpacity(0.5)
                      : const Color(0xCC210741).withOpacity(0.8)),
              borderRadius: BorderRadius.circular(16)),
          child: Text(text,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'JosefinSans-Light')),
        ),
      ),
    );
  }
}

class DoneButton extends StatelessWidget {
  final String text;
  final List<bool> isSelected;
  final onPressed;

  DoneButton(this.text, this.onPressed, this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
          gradient: isSelected.contains(true)
              ? const LinearGradient(colors: [basePink, darkPink])
              : LinearGradient(colors: [
                  const Color(0xBEBEBE).withOpacity(0.95),
                  const Color(0xBEBEBE).withOpacity(0.95)
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

Repeating periodic(int repeating) {
  print('input $repeating');
  switch (repeating) {
    case 1:
      {
        return Repeating.weekly;
      }
    case 2:
      {
        return Repeating.monthly;
      }
    default:
      {
        return Repeating.daily;
      }
  }
}

String reformatTimeOfDay(String time) {
  switch (time) {
    case 'Wake up':
      {
        return 'wakeup';
      }
    case 'Morning':
      {
        return 'morning';
      }
    case 'Noon':
      {
        return 'noon';
      }
    case 'Evening':
      {
        return 'evening';
      }
    default:
      {
        return 'beforesleep';
      }
  }
}

class Tab extends StatelessWidget {
  final String label;
  final int index;
  final isSelectedIndex;
  Tab(
      {Key? key,
      required this.label,
      required this.index,
      required this.isSelectedIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 38,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontFamily: 'JosefinSans-Light',
                fontWeight: FontWeight.w300,
                fontSize: 16,
                letterSpacing: -0.3),
          ),
        ));
  }
}

class WidgetGenerator extends StatefulWidget {
  final int selector;
  final Data inputData;
  List<bool> isSelected = List.generate(31, (index) => false);
  List<String> day = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List<int> days = List.generate(30, (index) => index + 1);

  WidgetGenerator({Key? key, required this.selector, required this.inputData})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _WidgetGenerator();
  }
}

List<DateTime> getDates(int dayOfWeek) {
  DateTime currentData = DateTime.now();
  List<DateTime> temp = List.empty(growable: true);
  for (int i = 0; i < 31; i++) {
    DateTime data = DateTime(currentData.year, currentData.month, i, 0, 0);
    if (data.weekday == dayOfWeek) {
      temp.add(data);
    } else {
      continue;
    }
  }
  return temp;
}

class _WidgetGenerator extends State<WidgetGenerator> {
  @override
  initState() {
    widget.inputData.dates = List.empty(growable: true);
    super.initState();
  }

  addWeekDays(String day) {
    switch (day) {
      case 'Mon':
        {
          return getDates(DateTime.monday);
        }
      case 'Tue':
        {
          return getDates(DateTime.tuesday);
        }
      case 'Wed':
        {
          return getDates(DateTime.wednesday);
        }
      case 'Thu':
        {
          return getDates(DateTime.thursday);
        }
      case 'Fri':
        {
          return getDates(DateTime.friday);
        }
      case 'Sat':
        {
          return getDates(DateTime.saturday);
        }
      case 'Sun':
        {
          return getDates(DateTime.sunday);
        }
      default:
        {
          return [DateTime.now()];
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          if (widget.selector == 1)
            for (int i = 0; i < widget.day.length; i++)
              DayCard(
                  isSelected: widget.isSelected[i],
                  onTap: () => setState(() {
                        widget.isSelected[i] = true;
                        List<DateTime> temp=addWeekDays(widget.day[i]);
                        if(widget.isSelected[i]){
                          if(widget.inputData.dates==null){
                            widget.inputData.dates=temp;
                          }else{
                            for(int i=0;i<temp.length;i++) {
                              widget.inputData.dates?.add(temp[i]);
                            }
                          }

                        }
                      }),
                  day: widget.day[i]),
          if (widget.selector == 2)
            for (int i = 0; i < 30; i++)
              DaysMonthCard(
                  isSelected: widget.isSelected[i],
                  onTap: () => setState(() {
                        widget.isSelected[i] = true;
                        List<DateTime> temp=List.empty(growable: true);
                        if(widget.isSelected[i]){
                          if(widget.inputData.dates==null){
                            widget.inputData.dates!.add(DateTime.now());
                          }else{
                            widget.inputData.dates?.add(DateTime.utc(DateTime.now().year,1,i+1,0,0,0,0,0));
                          }

                        }
                      }),
                  day: '${i + 1}'),
        ],
      ),
    );
  }
}
