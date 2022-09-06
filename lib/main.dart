import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/home/providers/settings_provider.dart';
import 'package:islami/home/quran/sura_details.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/my_theme.dart';
import 'package:provider/provider.dart';
import 'home/hadeth/hadeth_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp( ChangeNotifierProvider<SettingsProvider>(
      create: (buildContext){return SettingsProvider();},
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingsProvider.currentTheme,
      routes: {
        HomeScreen.routeName : (_) => HomeScreen(),
        SuraDetailesScreen.routeName : (_) => SuraDetailesScreen(),
        HadethDetailesScreen.routeName : (_) => HadethDetailesScreen(),

      },
      initialRoute: HomeScreen.routeName,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(settingsProvider.currentLang),
    );
  }
}