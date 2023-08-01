import 'dart:math';

import 'package:firstproject/moduels/result-screen/result-screen.dart';
import 'package:flutter/material.dart';

class newcalc extends StatefulWidget {
  @override
  State<newcalc> createState() => _newcalcState();
}

class _newcalcState extends State<newcalc> {
  bool ismale=true;
  double x=180;
  double age =20;
  double weight=69;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEW'),
      ),
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      ismale=true;
                    });
                  },
                  child: Container(
                    decoration:BoxDecoration(
                      color: ismale? Colors.blue:Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(children: [
                      Image(
                        image: AssetImage('assets/images/male.png'),
                        width: 90,
                        height: 90,
                      ),
                      SizedBox(height: 15,),
                      Text('Male',style:
                      TextStyle(
                          fontSize: 20,
                          color: Colors.black.withOpacity(.8)
                      ),)
                    ],),

                  ),
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                   setState(() {
                     ismale=false;
                   });
                  },
                  child: Container(
                    decoration:BoxDecoration(
                      color:ismale? Colors.grey:Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(children: [
                      Image(
                        image: AssetImage('assets/images/female.png'),
                        width: 90,
                        height: 90,
                      ),
                      SizedBox(height: 15,),
                      Text('Female',style:
                      TextStyle(
                          fontSize: 20,
                          color: Colors.black.withOpacity(.8)
                      ),)
                    ],),

                  ),
                ),
              ),

            ],),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('HEIGHT',style:
                TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(.8)
                ),)   ,
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.baseline,
                 textBaseline: TextBaseline.alphabetic,
                 children: [
                 Text('${x.round()}',style:
                 TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                   color: Colors.black,
                 ),),
                 SizedBox(width: 5,),
                 Text('CM',style:
                 TextStyle(
                   fontSize: 20,
                   color: Colors.black,
                 ),),
               ],),
                  Slider(
                      value:x,
                      min: 60,
                      max: 360,
                      onChanged: (value){
                        setState(() {
                          x=value;
                        });
                       })
              ],),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: [
              Expanded(
                child: Container(
                  decoration:BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('AGE',style:
                    TextStyle(
                        fontSize: 20,
                        color: Colors.black.withOpacity(.8)
                    ),),
                    SizedBox(height: 5,),
                    Text('${age.round()}',style:
                    TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      FloatingActionButton(onPressed:(){
                        setState(() {
                          age--;
                          print(age);
                        });
                      },child: Icon(Icons.remove),mini: true,),
                      FloatingActionButton(onPressed:(){
                        setState(() {
                          age++;
                          print(age);
                        });
                      },child: Icon(Icons.add),mini: true,)
                    ],)
                  ],),
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: Container(
                  decoration:BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('weight',style:
                      TextStyle(
                          fontSize: 20,
                          color: Colors.black.withOpacity(.8)
                      ),),
                      SizedBox(height: 5,),
                      Text('${weight.round()}',style:
                      TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(onPressed:(){
                            setState(() {
                              weight--;
                              print(weight);
                            });
                          },child: Icon(Icons.remove),mini: true,),
                          FloatingActionButton(onPressed:(){
                            setState(() {
                              weight++;
                              print(weight);
                            });
                          },child: Icon(Icons.add),mini: true,)
                        ],)
                    ],),
                ),
              ),

            ],),
          ),
        ),
        Container(
            color: Colors.blue,
            width: double.infinity,
            child: MaterialButton(
              height: 50,
              onPressed: (){
                double result = weight / pow(x / 100, 2);
                print(result.round());
                Navigator.push(context,MaterialPageRoute(builder:(context){
                  return bmiresult(ismale:ismale,age:age.round(),result:result.round(),);
                }));
              },child:
            Text('CALCULATE',style:TextStyle(color: Colors.white) ,),)),
      ]),
    );
  }
}
