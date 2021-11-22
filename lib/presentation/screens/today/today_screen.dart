import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/src/provider.dart';
import 'package:sleep_sound/data/data.dart';
import 'package:sleep_sound/data/list_habits.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';
import 'package:sleep_sound/presentation/components/buttons/raw_buttons.dart';
import 'package:sleep_sound/presentation/components/cards/habit_card.dart';
import 'package:sleep_sound/presentation/components/text_field/raw_textfield.dart';

class TodayScreen extends StatefulWidget{
  const TodayScreen({Key? key}) : super(key: key);
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
  List<bool> selectedDate=List.generate(5, (index) => false);
  List<DateTime> days =List.generate(5, (index) => DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day-2+index,0,0,0,0,0));
  List<Data> data=[];
  @override
  initState(){
    data=context.read<ListHabits>().listHabits;
    selectedDate[2]=true;

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

  bool contains(List<Data> data,List<DateTime> days,List<bool> selectedDate,String tag){
    bool flag=false;
    for(int i=0;i<data.length;i++){
      for(int j=0;j<data[i].dates!.length;j++) {
          if((data[i].dates![j].day==days[selectedDate.indexOf(true)].day || data[i].repeat==Repeating.daily)&&data[i].tag==tag){
            flag=true;
        }
      }
    }
    return flag;
  }

  @override
  Widget build(BuildContext context){
    data=context.read<ListHabits>().listHabits;
      return Scaffold(
      appBar: const RawAppBar(
          title:'today',
          addBtn: false,
          backBtn: false,
      ),
      body: Container(
          decoration: const BoxDecoration(
              gradient: customGradient
          ),
          child:  data.isNotEmpty
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.65,
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
                        width: MediaQuery.of(context).size.width*0.2,
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
                    itemCount: selectedDate.length,
                    itemBuilder: (context,index)=>Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        onTap: ()=>setState((){
                          selectedDate=List.generate(5, (index) => false);
                          selectedDate[index]=!selectedDate[index];
                        }),
                        child: Container(
                          height: 75,
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                          decoration: BoxDecoration(
                              color: const Color(0xCC210741).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: selectedDate[index]
                                    ? Colors.white.withOpacity(0.5)
                                    : const Color(0xCC210741).withOpacity(0.8)
                              )
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
                              if(index==1 || index==2 || index==3) const SizedBox(height: 17),
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
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                            visible: data.isNotEmpty&&contains(data,days,selectedDate,'wakeup'),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                RawTitle(
                                    onTap: _onTap,
                                    label: 'Wake up',
                                    textStyle: _textStyle
                                ),
                                Wrap(
                                  children: [
                                    for(int i=0;i<data.length;i++)if(data[i].tag=='wakeup')HabitCard(habit:data[i].habit!,onTap: (){},isSelected: false)  ],
                                )
                              ],
                            )),
                        Visibility(
                          visible: data.isNotEmpty&&contains(data,days,selectedDate,'morning'),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              RawTitle(label: 'Morning', onTap: _onTap, textStyle: _textStyle),
                              Wrap(
                                children: [
                                  for(int i=0;i<data.length;i++)
                                    if(data[i].tag=='morning')HabitCard(habit:data[i].habit!,onTap: (){},isSelected: false)
                                ],
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: data.isNotEmpty&&contains(data,days,selectedDate,'noon'),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              RawTitle(
                                textStyle: _textStyle,
                                label: 'Noon',
                                onTap: _onTap,

                              ),
                              Wrap(
                                children: [
                                  for(int i=0;i<data.length;i++)if(data[i].tag=='noon')HabitCard(habit:data[i].habit!,onTap: (){},isSelected: false)],
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: data.isNotEmpty&&contains(data,days,selectedDate,'evening'),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              RawTitle(
                                onTap: _onTap,
                                textStyle: _textStyle,
                                label: 'Evening',

                              ),
                              Wrap(
                                children: [
                                  for(int i=0;i<data.length;i++)if(data[i].tag=='evening')HabitCard(habit:data[i].habit!,onTap: (){},isSelected: false)
                                ],
                              )
                            ],
                          ),
                        ),
                        Visibility(
                            visible: data.isNotEmpty&&contains(data,days,selectedDate,'beforesleep'),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                RawTitle(
                                  onTap: _onTap,
                                  textStyle: _textStyle,
                                  label: 'Before sleep'),
                                Wrap(
                                  children: [
                                    for(int i=0;i<data.length;i++)if(data[i].tag=='beforesleep')HabitCard(habit:data[i].habit!,onTap: (){},isSelected: false)
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
        : Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.1,
              )
            ],
          ),
        ),
    );
  }
  _onTap()=>Navigator.pushNamed(context, '/');
  final TextStyle _textStyle=const TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontFamily: 'JoseFinSans-Light',
    fontWeight: FontWeight.w400,
    letterSpacing: -0.3
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

class RawTitle extends StatelessWidget{
  final String label;
  final onTap;
  final TextStyle textStyle;
  const RawTitle({required this.label, required this.onTap,required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Text(label, style: textStyle)
    );
  }

}