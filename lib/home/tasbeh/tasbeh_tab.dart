
import 'package:flutter/material.dart';

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
    return Container(
      width: double.infinity,
      child: Column(
        children: [
        Stack(
          alignment: Alignment.topCenter,
            children: [
              Image.asset('assets/images/head_of_sebha.png'),
              InkWell(
                onTap: onTasbehTab,
                child: Padding(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.height * .08),
                  child : Transform.rotate(angle: angle,
                  child: Image.asset('assets/images/body_of_sebha.png'),
                ),
              ),
              )],
        ),
          Text('num of tasbehat',
          style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.w500,
          ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffB7935F),
            ),
              child: Text('$counter',style:TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ),

          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xffB7935F),
            ),
            child: Text('${tasbeh[index]}'
              ,style:TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
              SizedBox(height: 5,),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffB7935F),
                ),
                child: InkWell(
                    onTap: ResetCounter,
                    child: Text('Reset',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                ),
              ),
        ],
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


