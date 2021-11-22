import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleep_sound/routes.dart';

import 'data/data.dart';
import 'data/list_habits.dart';
import 'data/pickup_habits.dart';
import 'data/resources/color_palette.dart';


bool seen=false;
bool subscribe=false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  seen = prefs.getBool("seen") ?? false;
  await prefs.setBool("seen", true);
  subscribe = prefs.getBool("subscribe") ?? false;
  seen=false;
  runApp(const App());
}

class App extends StatefulWidget{
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _App extends State<App>{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<PickUpHabits>(create: (_) => PickUpHabits()),
          Provider<Data>(create: (_) => Data()),
          Provider<ListHabits>(create: (_) => ListHabits())
        ],
        child: MaterialApp(
            theme: ThemeData.dark(),
            color: textWhite,
            debugShowCheckedModeBanner: false,
            initialRoute: seen ? '/' : "/onboarding" ,
            routes: routes
        ));
  }

}