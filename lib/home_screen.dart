import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:islami/home/quran/quran_tab.dart';
import 'package:islami/home/radio/radio_tab.dart';
import 'package:islami/home/settings/settings_tab.dart';
import 'package:islami/home/tasbeh/tasbeh_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'home/providers/settings_provider.dart';

class HomeScreen extends StatefulWidget{
  static const String routeName='Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int selectedIndex = 0;

  Widget build(BuildContext context) {
   var provider = Provider.of<SettingsProvider>(context);
    return Container(
     decoration: BoxDecoration(
       image: DecorationImage(
         image: AssetImage(
           provider.getMainBackGround(),
         ),
         fit: BoxFit.fill,
       ),
     ),
       child: Scaffold(
         backgroundColor: Colors.transparent,
         appBar: AppBar(
           centerTitle: true,
           backgroundColor: Colors.transparent,
           elevation: 0,
           title: Text(
             AppLocalizations.of(context)!.app_title,
           ),
         ),
         bottomNavigationBar: BottomNavigationBar(
           currentIndex:selectedIndex,
           onTap: (index){
             selectedIndex = index;
             setState((){});
           },
           selectedIconTheme: IconThemeData(
             color: Colors.black,
           ),
           unselectedIconTheme: IconThemeData(
             color: Colors.white,
           ),
           selectedLabelStyle: TextStyle(color: Colors.black,),
           selectedItemColor: Colors.brown,
           unselectedItemColor: Colors.white,
           items: [
             BottomNavigationBarItem(
                 backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                 icon: ImageIcon(AssetImage('assets/images/quran.png')),
                 label:AppLocalizations.of(context)!.quran_title),
             BottomNavigationBarItem(
                 backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                 icon: ImageIcon(AssetImage('assets/images/quran-quran-svgrepo-com.png')),
                 label: AppLocalizations.of(context)!.hadeth_title),
             BottomNavigationBarItem(
                 backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                 icon: ImageIcon(AssetImage('assets/images/sebha.png')),
                 label:AppLocalizations.of(context)!.tasbeh_title),
             BottomNavigationBarItem(
                 backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                 icon: ImageIcon(AssetImage('assets/images/radio_blue.png')),
                 label:AppLocalizations.of(context)!.radio_title),
             BottomNavigationBarItem(
                 backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                 icon: Icon(Icons.settings),
                 label: AppLocalizations.of(context)!.settings_title),


           ],
         ),
         body: tabs[selectedIndex],
       ),
   );
  }
  List<Widget> tabs = [QuranTab(),HadethTab(),TasbehTab(),RadioTab(),SettingsTab()];
}