import 'package:flutter/material.dart';
import 'package:islami/home/quran/sura_details.dart';

class VerseWidget extends StatelessWidget{
  String content;
  int index;
  VerseWidget(this.index,this.content);
  @override
  Widget build(BuildContext context) {
    return Container(
        //alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
        child: Text('$content {${index+1}}',
          style: Theme.of(context).textTheme.headlineSmall,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        )
    );
  }

}