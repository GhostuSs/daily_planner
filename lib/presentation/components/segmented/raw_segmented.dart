import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_sound/presentation/components/cards/day_card.dart';
import 'package:sleep_sound/presentation/components/cards/month_days_card.dart';

enum SelectedState{
  daily,
  weekly,
  monthly
}

class RawSegmented extends StatefulWidget {
  const RawSegmented({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RawSegmented();
  }
}

class _RawSegmented extends State<RawSegmented> {
  var segmentedControlValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: CupertinoSlidingSegmentedControl(
              groupValue: segmentedControlValue,
              backgroundColor: Color(0xFF99210741),
              thumbColor: Color(0xFF290753),
              children: <int, Widget>{
                0: Tab(label: 'Daily', index: 0,isSelectedIndex: segmentedControlValue),
                1: Tab(label: 'Weekly', index: 1,isSelectedIndex: segmentedControlValue),
                2: Tab(label: 'Monthly', index: 2,isSelectedIndex: segmentedControlValue),
              },
              onValueChanged: (int? value) {
                setState(() {
                  segmentedControlValue = value!;
                });
              }),
        ),
        const SizedBox(height: 20),
        WidgetGenerator(selector: segmentedControlValue,)
      ],
    );
  }
}

class Tab extends StatelessWidget {
  final String label;
  final int index;
  final isSelectedIndex;
  Tab({Key? key, required this.label, required this.index,required this.isSelectedIndex})
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
              letterSpacing: -0.3
            ),
          ),
        ));
  }
}
class WidgetGenerator extends StatefulWidget{
  final int selector;
  List<bool> isSelected=List.generate(31, (index) => false);
  List<String> day=['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];
  List <int> days=List.generate(30,(index)=>index+1);

  WidgetGenerator({Key? key, required this.selector}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _WidgetGenerator();
  }
}

class _WidgetGenerator extends State<WidgetGenerator>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          if(widget.selector==1)for(int i=0;i<widget.day.length;i++)DayCard(isSelected: widget.isSelected[i], onTap: ()=>setState((){widget.isSelected[i]=!widget.isSelected[i];}), day: widget.day[i]),
          if(widget.selector==2)for(int i=0;i<30;i++)DaysMonthCard(isSelected: widget.isSelected[i], onTap: ()=>setState((){widget.isSelected[i]=!widget.isSelected[i];}), day: '${i+1}'),
        ],
      ),
    );
  }
  
}