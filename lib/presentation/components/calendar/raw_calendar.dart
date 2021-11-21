import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleep_sound/data/data.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/presentation/screens/home/description.dart';
import 'package:table_calendar/table_calendar.dart';

class RawCalendar extends StatefulWidget{
  RawCalendar({Key? key,required this.selectedDay,required this.focusedDay,required this.selectedEvents, required this.repeating}) : super(key: key);
  final Repeating repeating;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  List<DateTime> selectedEvents;
  @override
  State<StatefulWidget> createState() {
    return _RawCalendar();
  }

}
class _RawCalendar extends State<RawCalendar>{

  @override
  Widget build(BuildContext context) {
    print(widget.selectedEvents);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TableCalendar(
        focusedDay: widget.selectedDay,
        firstDay: DateTime(2010),
        lastDay: DateTime(2050),
        rowHeight: 50,
        daysOfWeekVisible: true,
        //Day Changed
        onDaySelected: (DateTime selectDay, DateTime focusDay) {
          setState(() {
            widget.selectedDay = selectDay;
          });
        },
        selectedDayPredicate: (DateTime date) {
          return isSameDay(widget.selectedDay, date);
        },
        eventLoader: (DateTime date){
          List<DateTime> temp=List.empty(growable: true);
          switch(widget.repeating) {
            case Repeating.weekly:
              {
                for (int i = 0; i < widget.selectedEvents.length; i++) {
                  if (date.day == widget.selectedEvents[i].day &&
                      date.month == widget.selectedEvents[i].month) {
                    temp.add(widget.selectedEvents[i]);
                  }
                }
                break;
              }
            case Repeating.daily:
              {
                temp = [DateTime.now()];
                break;
              }
            case Repeating.monthly:
              {
                for (int i = 0; i < widget.selectedEvents.length; i++) {
                  if (date.day == widget.selectedEvents[i].day) {
                    temp.add(widget.selectedEvents[i]);
                  }
                }
                break;
              }
          }
          return temp;
        },
        calendarStyle: CalendarStyle(
            outsideDaysVisible: true,
            outsideTextStyle:
            TextStyle(color: Colors.white.withOpacity(0.4)),
            defaultTextStyle: const TextStyle(
                color: Colors.white,
                fontFamily: 'JosefinSans-Bold',
                fontWeight: FontWeight.w500,
                fontSize: 15),
            selectedTextStyle: const TextStyle(
                color: Colors.white,
                fontFamily: 'JosefinSans-Bold',
                fontWeight: FontWeight.w500,
                fontSize: 15),
            todayTextStyle: const TextStyle(
                color: Colors.white,
                fontFamily: 'JosefinSans-Bold',
                fontWeight: FontWeight.w500,
                fontSize: 15),
            weekendTextStyle: const TextStyle(
                color: Colors.white,
                fontFamily: 'JosefinSans-Bold',
                fontWeight: FontWeight.w500,
                fontSize: 15),
            markerDecoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(stops: const [
                  0.0,
                  0.31,
                  1.0
                ], colors: [
                  const Color(0xFFFFCACF).withOpacity(0.95),
                  const Color(0xFFFEA7AF).withOpacity(0.95),
                  const Color(0xFFF862BD).withOpacity(0.95)
                ])),
            todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(stops: const [
                  0.0,
                  0.31,
                  1.0
                ], colors: [
                  const Color(0xFFFFCACF).withOpacity(0.95),
                  const Color(0xFFFEA7AF).withOpacity(0.95),
                  const Color(0xFFF862BD).withOpacity(0.95)
                ])),
            selectedDecoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(stops: const [
                  0.0,
                  0.31,
                  1.0
                ], colors: [
                  const Color(0xFFFFCACF).withOpacity(0.95),
                  const Color(0xFFFEA7AF).withOpacity(0.95),
                  const Color(0xFFF862BD).withOpacity(0.95)
                ]))),
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          leftChevronPadding: const EdgeInsets.symmetric(vertical: 10),
          rightChevronPadding: const EdgeInsets.symmetric(vertical: 10),
          leftChevronIcon: CustomChevron(direction: Direction.left),
          rightChevronIcon:
          CustomChevron(direction: Direction.right),
          titleTextStyle: const TextStyle(
            color: textWhite,
            fontFamily: 'JosefinSans-Bold',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            letterSpacing: -0.3,
          ),
          headerPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

}