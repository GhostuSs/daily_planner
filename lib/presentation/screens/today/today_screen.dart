import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';
import 'package:sleep_sound/presentation/components/buttons/raw_buttons.dart';
import 'package:sleep_sound/presentation/components/cards/habit_card.dart';
import 'package:sleep_sound/presentation/components/text_field/raw_textfield.dart';

class TodayScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _TodayScreen();
  }
}

class _TodayScreen extends State<TodayScreen>{

  var textFieldController = TextEditingController();
  String month='';
  int daysInMonth=0;
  int today=0;
  List<Widget> wakeUp =[const HabitCard(habit: 'excersize',)];
  List morning=[1];
  List noon = [1];
  List evening=[1];

  @override
  initState(){
    DateTime dateTime = DateTime.now();
    today=dateTime.day;
    switch(dateTime.month){
      case 1: {
        month='jan';
        daysInMonth=31;
        break;
      }
      case 2: {
        month='feb';
        daysInMonth=28;
        break;
      }
      case 3: {
        month='mar';
        daysInMonth=31;
        break;
      }
      case 4: {
        month='apr';
        daysInMonth=30;
        break;
      }
      case 5: {
        month='may';
        daysInMonth=31;
        break;
      }
      case 6: {
        month='june';
        daysInMonth=30;
        break;
      }
      case 7: {
        month='july';
        daysInMonth=31;
        break;
      }
      case 8: {
        month='aug';
        daysInMonth=31;
        break;
      }
      case 9: {
        month='sep';
        daysInMonth=30;
        break;
      }
      case 10: {
        month='oct';
        daysInMonth=31;
        break;
      }
      case 11: {
        month='nov';
        daysInMonth=30;
        break;
      }
      case 12: {
        month='dec';
        daysInMonth=31;
        break;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: RawAppBar(
          title:'today',
          addBtn: true
      ),
      body: Container(
          decoration: const BoxDecoration(
              gradient: customGradient
          ),
          child:  Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Container(
                      width: width*0.65,
                      decoration: BoxDecoration(
                          color: const Color(0xCC210741).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: RawTextField(
                          null,
                          'Find your habit',
                          Icons.search,
                          textFieldController
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 46,
                        width: width*0.2,
                        child: RawButton('OK', (){}),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context,index)=>Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        height: 75,
                        width: 100,
                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        decoration: BoxDecoration(
                            color: Color(0xCC210741).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textDay(index),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: textWhite.withOpacity(0.9),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'JosefinSans-Light',
                                  fontSize: 14
                              ),
                            ),
                            if(index==1 || index==2 || index==3) SizedBox(height: 17),
                            Text(
                              '${DateTime.now().day-2+index} $month',
                              style: TextStyle(
                                  color: textWhite.withOpacity(0.5),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'JosefinSans-Light',
                                  fontSize: 14
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: wakeUp.isNotEmpty,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children: [
                          const SizedBox(width: 15),
                          Text(
                              'Wake up',
                              style: _textStyle
                          )
                        ]
                    ),
                    for(int i=0;i<wakeUp.length;i++)wakeUp[i]
                  ],
                ),
              ),
              Visibility(
                visible: morning.isNotEmpty,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children: [
                          const SizedBox(width: 15),
                          Text(
                              'Morning',
                              style: _textStyle
                          )
                        ]
                    )
                  ],
                ),
              ),
              Visibility(
                visible: noon.isNotEmpty,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children: [
                          const SizedBox(width: 15),
                          Text(
                              'Noon',
                              style: _textStyle
                          )
                        ]
                    )
                  ],
                ),
              ),
              Visibility(
                visible: evening.isNotEmpty,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        Text(
                          'Evening',
                          style: _textStyle
                            )
                      ]
                    )
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
  final TextStyle _textStyle=const TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontFamily: 'JoseFinSans-Light',
    fontWeight: FontWeight.w400
  );

  String textDay(int index){
    String temp='';
    switch(index){
      case 0:{
        temp='Day before\nyesterday';
        break;
      }
      case 1:{
        temp='Yesterday';
        break;
      }
      case 2:{
        temp='Today';
        break;
      }
      case 3:{
        temp='Tommorow';
        break;
      }
      case 4:{
        temp='Day after\ntommorow';
        break;
      }
    }
    return temp;
  }
}