import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/src/provider.dart';
import 'package:sleep_sound/data/list_habits.dart';
import 'package:sleep_sound/data/pickup_habits.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';
import 'package:sleep_sound/presentation/components/cards/custom_habit_card.dart';
import 'package:sleep_sound/presentation/components/segmented/raw_segmented.dart';
import 'package:sleep_sound/presentation/components/text_field/raw_textfield.dart';

class AddCustomHabitScreen extends StatefulWidget {
  const AddCustomHabitScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddCustomHabitScreenState();
  }
}

class _AddCustomHabitScreenState extends State<AddCustomHabitScreen> {

  List<bool> isSelectedHabit=[];
  List<bool> isSelectedTime = [];
  static const List<String> timeOfDay = [
    'Wake up',
    'Morning',
    'Noon',
    'Evening',
    'Before sleep'
  ];
  var _textFieldController = TextEditingController();

  @override
  initState(){
    isSelectedTime=List.generate(5, (index) => false);
    isSelectedHabit = List.generate(15, (index) => false);
    super.initState();
  }

  _onPressed() {
    for (int i = 0; i <15; i++) {
      if (isSelectedHabit[i] == true) {
        context.read<ListHabits>().listHabits.add(context.read<PickUpHabits>().customHabitData[i]);
      }
    }
    print(context.read<ListHabits>().printList());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RawAppBar(title: ' ', addBtn: false),
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
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Habit name',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontFamily: 'JosefinSans-Light',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        letterSpacing: -0.3
                    ),
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
              child: RawTextField(null, '', null,
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
                              Row(
                                children: [
                                  SizedBox(width: 20),
                                  Text(
                                      'Pick up an icon and color',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'JosefinSans-Light',
                                      letterSpacing: -0.3,
                                      fontSize: 24.0
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: Wrap(
                                  crossAxisAlignment:
                                  WrapCrossAlignment.center,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    for (int i = 0; i <15; i++)
                                      CustomHabitCard(
                                        habit: context.read<PickUpHabits>().customHabitData[i].habit!,
                                        onTap: () => setState((){
                                          isSelectedHabit[i] = !isSelectedHabit[i];
                                          print(isSelectedHabit[i]);
                                        }),
                                        isSelected: isSelectedHabit[i],
                                      ),
                                  ],
                                ),
                              )
                            ],
                          )),
                      Visibility(
                          visible: context.read<PickUpHabits>().customHabitData.isNotEmpty,
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
                                        fontSize: 24.0
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    for(int i=0;i<timeOfDay.length;i++)CustomHabitIcon(
                                        isSelectedTime: isSelectedTime[i],
                                        text: timeOfDay[i],
                                        onTap: ()=>setState((){
                                          isSelectedTime=List.generate(timeOfDay.length, (index) => false);
                                          isSelectedTime[i]=!isSelectedTime[i];
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
                                        fontSize: 24.0
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              RawSegmented()
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
class CustomHabitIcon extends StatelessWidget{
  final bool isSelectedTime;
  final String text;
  final onTap;
  CustomHabitIcon({required this.isSelectedTime,required this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
          decoration: BoxDecoration(
              color: const Color(0xCC210741).withOpacity(0.8),
              border: Border.all(color: isSelectedTime ? Colors.white.withOpacity(0.5) :const Color(0xCC210741).withOpacity(0.8)),
              borderRadius: BorderRadius.circular(16)
          ),
          child: Text(text,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'JosefinSans-Light'
              )),
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
