import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:islami/home/quran/verse_widget.dart';
import 'package:provider/provider.dart';

import '../providers/settings_provider.dart';

class HadethDetailesScreen extends StatefulWidget{
  static const String routeName = 'hadeth-details';

  @override
  State<HadethDetailesScreen> createState() => _HadethDetailesScreenState();
}

class _HadethDetailesScreenState extends State<HadethDetailesScreen> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage(
      provider.getMainBackGround(),
    ),
    fit: BoxFit.fill,
    ),),
    child: Scaffold(
      appBar: AppBar(centerTitle: true,
        title: Text(
          args.title
        ),
      ),
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal:12 ,vertical:64 ),
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(24)
          ),
           child:Text(
             args.content,
             textDirection: TextDirection.rtl,
             style: Theme.of(context).textTheme.headline5,
           )
         ),
      ),
    ));
  }
}