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

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HabitsScreen();
  }
}

class _HabitsScreen extends State<HabitsScreen> {
  List data = [];
  List<bool> isSelected = List.generate(tags.length, (index) => false);
  @override
  initState() {
    isSelected[0] = true;
    checkData();
    super.initState();
  }
  bool checkData(){
    bool flag=false;
    data = context.read<ListHabits>().listHabits;
    data.isNotEmpty
    ? flag=true
        :flag=false;
    return flag;
  }
  @override
  Widget build(BuildContext context) {
    if (isSelected.contains(true) == false) isSelected[0] = true;
    checkData();
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
        child: checkData()
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
                      PointColumn(
                          data: data,
                          isSelected: isSelected,
                          searchTag: 'wakeup',
                          isSelectedIndex:1
                      ),
                      PointColumn(
                          data: data,
                          isSelected: isSelected,
                          searchTag: 'morning',
                          isSelectedIndex:2
                      ),
                      PointColumn(
                          data: data,
                          isSelected: isSelected,
                          searchTag: 'noon',
                          isSelectedIndex:3
                      ),
                      PointColumn(
                          data: data,
                          isSelected: isSelected,
                          searchTag: 'evening',
                          isSelectedIndex:4
                      ),
                      PointColumn(
                          data: data,
                          isSelected: isSelected,
                          searchTag: 'beforesleep',
                          isSelectedIndex:5),
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
        )
      ),
    );
  }
}

class PointColumn extends StatelessWidget{
  final List data;
  final String searchTag;
  final List<bool> isSelected;
  final int isSelectedIndex;
  const PointColumn({Key? key, required this.data,required this.isSelected, required this.searchTag, required this.isSelectedIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: data.isNotEmpty &&
            (isSelected[0] || isSelected[isSelectedIndex])&&checkContaining(data, searchTag),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PartOfDayLabel(label: reformatTagToLabel(searchTag)),
            for (int i = 0; i < data.length; i++)
              if (data[i].tag == searchTag)
                HomeCard(habit: data[i].habit)
          ],
        ));
  }

}
String reformatTagToLabel(String habit){
  String temp='';
  switch(habit){
    case 'wakeup':{
      temp='Wake up';
      break;
    }
    case 'morning':{
      temp='Morning';
      break;
    }
    case 'noon':{
      temp='Noon';
      break;
    }
    case 'evening':{
      temp='Evening';
      break;
    }
    case 'beforesleep':{
      temp='Before sleep';
      break;
    }
  }
  return temp;
}
bool checkContaining(List data,String searchTag){
  var contain = data.where((element) => element.tag == searchTag);
  if (contain.isEmpty){
  return false;}
  else {
    return true;
  }
}
