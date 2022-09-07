
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../providers/settings_provider.dart';


class TasbehTab extends StatefulWidget{
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter =0;

  List<String> tasbeh = [
    'سبحان الله',
    'الحمدلله',
    'لا اله الا الله',
    'الله اكبر',
    'لا حول ولا قوة الا بالله'
  ];

  int index = 0;
  double angle = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
          Stack(
            alignment: Alignment.topCenter,
              children: [
                Image.asset(provider.getHeadOfSebha()),
                InkWell(
                  onTap: onTasbehTab,
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height * .08),
                    child : Transform.rotate(angle: angle,
                    child: Image.asset(provider.getBodyOfSebha()),
                  ),
                ),
                )],
          ),
            Text(AppLocalizations.of(context)!.num_of_tasbehat,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25,
                fontWeight: FontWeight.w500,
            ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).primaryColor,
              ),
                child: Text('$counter',
                  style: Theme.of(context).textTheme.headline5,
                ),

            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).primaryColor,
              ),
              child: Text('${tasbeh[index]}'
                ,style: Theme.of(context).textTheme.headline6,
              ),
              ),
                SizedBox(height: 7,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: InkWell(
                      onTap: ResetCounter,
                      child: Text(AppLocalizations.of(context)!.reset,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  void onTasbehTab(){
    counter++;
    if(counter % 33 == 0){
      index++;
    }
    if (index==tasbeh.length){
      index = 0;
    }
    angle += 1/33;
    setState((){});

  }
  void ResetCounter(){
    counter = 0;
    setState((){});
  }
}


