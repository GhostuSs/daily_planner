import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';
import 'package:sleep_sound/data/resources/decorations.dart';
import 'package:sleep_sound/presentation/components/appbars/raw_appbar.dart';
import 'package:table_calendar/table_calendar.dart';

class DescriptionScreen extends StatefulWidget {
  final String title;
  const DescriptionScreen({Key? key, required this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DescriptionScreen();
  }
}

class _DescriptionScreen extends State<DescriptionScreen> {
  @override
  initState() {
    super.initState();
  }

  String reformatHabit(String habit) {
    String temp = '';
    switch (habit) {
      case 'excersize':
        {
          temp = 'Excersize';
          break;
        }
      case 'lesscaffeine':
        {
          temp = 'Less caffeine';
          break;
        }
      case 'drinkwater':
        {
          temp = 'Drink water';
          break;
        }
      case 'read':
        {
          temp = 'Read';
          break;
        }
      case 'brush':
        {
          temp = 'Brush&floss';
          break;
        }
      case 'eatfruits':
        {
          temp = 'Eat fruits';
          break;
        }
      case 'fallasleepearly':
        {
          temp = 'Fall asleep early';
          break;
        }
      case 'wakeearly':
        {
          temp = 'Wake early';
          break;
        }
      case 'stretch':
        {
          temp = 'Stretch';
          break;
        }
      case 'takeashower':
        {
          temp = 'Take a shower';
          break;
        }
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: RawAppBar(title: reformatHabit(widget.title), addBtn: false),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(gradient: customGradient),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'your habits'.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'JosefinSans-Light',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2018, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    rowHeight: 50,
                    daysOfWeekVisible: true,
                    calendarStyle: CalendarStyle(
                      outsideDaysVisible: true,
                      outsideTextStyle: TextStyle(
                        color: Colors.white.withOpacity(0.4)
                      ),
                      defaultTextStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JosefinSans-Bold',
                        fontWeight: FontWeight.w500,
                        fontSize: 15
                      ),
                      selectedTextStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'JosefinSans-Bold',
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                      ),
                      todayTextStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'JosefinSans-Bold',
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                      ),
                      weekendTextStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'JosefinSans-Bold',
                          fontWeight: FontWeight.w500,
                          fontSize: 15
                      ),
                      markerDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              stops: const [
                                0.0,
                                0.31,
                                1.0
                              ],
                              colors: [
                                const Color(0xFFFFCACF).withOpacity(0.95),
                                const Color(0xFFFEA7AF
                                ).withOpacity(0.95),
                                const Color(0xFFF862BD).withOpacity(0.95)
                              ]
                          )
                      ),
                      todayDecoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              stops: const [
                                0.0,
                                0.31,
                                1.0
                              ],
                              colors: [
                                const Color(0xFFFFCACF).withOpacity(0.95),
                                const Color(0xFFFEA7AF
                                ).withOpacity(0.95),
                                const Color(0xFFF862BD).withOpacity(0.95)
                              ]
                          )
                      ),
                      selectedDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          stops: const [
                            0.0,
                            0.31,
                            1.0
                          ],
                          colors: [
                            const Color(0xFFFFCACF).withOpacity(0.95),
                            const Color(0xFFFEA7AF
                            ).withOpacity(0.95),
                            const Color(0xFFF862BD).withOpacity(0.95)
                          ]
                        )
                      )
                    ),
                    headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      leftChevronPadding: EdgeInsets.symmetric(vertical: 10),
                      rightChevronPadding: EdgeInsets.symmetric(vertical: 10),
                      leftChevronIcon: CustomChevron(direction: Direction.left),
                      rightChevronIcon: CustomChevron(direction: Direction.right),
                      titleTextStyle: const TextStyle(
                        color: textWhite,
                        fontFamily:'JosefinSans-Bold',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        letterSpacing: -0.3,
                      ),
                      headerPadding: EdgeInsets.zero,
                    ),

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      child: Text(
                        'Progression',
                        style: TextStyle(
                          color: textWhite.withOpacity(0.9),
                          fontSize: 24,
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'JosefinSans-Thin',
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                LinearProgressIndicator(
                  value: 0.15,
                  minHeight: 32,
                  backgroundColor: Color(0xCC210741),
                  color: darkPink,
                )


              ],
            )));
  }
}
enum Direction{
  left,
  right
}
class CustomChevron extends StatelessWidget{
  final Direction direction;
  CustomChevron({required this.direction});
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds)=>LinearGradient(
          stops: const [
            0.0,
            0.31,
            1.0
          ],
          colors: [
            const Color(0xFFFFCACF).withOpacity(0.95),
            const Color(0xFFFEA7AF).withOpacity(0.95),
            const Color(0xFFF862BD).withOpacity(0.95)
          ]
      ).createShader(bounds),
      child: Icon(
        direction==Direction.left
        ? Icons.chevron_left
        :Icons.chevron_right,
      ),
    );
  }

}
