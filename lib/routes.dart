import 'package:flutter/cupertino.dart';
import 'package:sleep_sound/presentation/screens/home/add_habit.dart';
import 'package:sleep_sound/presentation/screens/main_page.dart';
import 'package:sleep_sound/presentation/screens/onboarding/onboarding.dart';

var routes = {
  '/onboarding': (BuildContext context) => const OnBoardingScreen(),
  '/': (BuildContext context) => MainPage(),
  '/addhabit': (BuildContext context) => AddHabitScreen()
};