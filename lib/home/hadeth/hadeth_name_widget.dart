import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth_details.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:islami/home/quran/sura_details.dart';

class HadethNameWidget extends StatelessWidget{
  Hadeth hadeth;
  HadethNameWidget(this.hadeth);
  @override
  Widget build(BuildContext context) {
   return InkWell(
      onTap: (){
        Navigator.pushNamed(context, HadethDetailesScreen.routeName,
        arguments: hadeth
        );
      },
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Text(hadeth.title,
            style: Theme.of(context).textTheme.headline5,
          )),
   );
  }

}