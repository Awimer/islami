import 'package:flutter/material.dart';
import 'package:islami/home/quran/sura_details.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        SuraDetailesScreen.routeName : (_) => SuraDetailesScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}