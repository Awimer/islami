import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/hadeth_tab.dart';
import 'package:islami/my_colors.dart';
import 'package:islami/quran_tab.dart';
import 'package:islami/radio_tab.dart';
import 'package:islami/tasbeh_tab.dart';

class HomeScreen extends StatefulWidget{
  static const String routeName='Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  int selectedIndex = 0;

  Widget build(BuildContext context) {
   return Container(
     decoration: BoxDecoration(
       image: DecorationImage(
         image: AssetImage('assets/images/background_pattern.png',
         ),
         fit: BoxFit.fill,
       ),
     ),
       child: Scaffold(
         backgroundColor: Colors.transparent,
         appBar: AppBar(centerTitle: true,
           backgroundColor: Colors.transparent,
           elevation: 0,
           title: Text('اسلامى',style: TextStyle(
             color: Colors.black,
             fontSize: 30,
             fontWeight: FontWeight.w500,
           ),),
         ),
         bottomNavigationBar: Theme(
           data: Theme.of(context).copyWith(
             canvasColor: MyColors.primaryColor
           ),
           child: BottomNavigationBar(
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
               BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/quran.png')),label:'Quran'),
               BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/quran-quran-svgrepo-com.png')),label:'Hadeth'),
               BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/sebha.png')),label:'Sebha'),
               BottomNavigationBarItem(icon: ImageIcon(AssetImage('assets/images/radio.png')),label:'Radio'),

             ],
           ),
         ),
         body: tabs[selectedIndex],
       ),
   );
  }
  List<Widget> tabs = [QuranTab(),HadethTab(),TasbehTab(),RadioTab()];
}