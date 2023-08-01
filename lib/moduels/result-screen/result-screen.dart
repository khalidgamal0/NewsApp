import 'package:flutter/material.dart';

class bmiresult extends StatelessWidget {
  final bool? ismale;
  final int? age;
  final int? result;
  final int? height;
  final int? weight;
  bmiresult(

      {
        @required this.ismale,
        @required this.result,
        @required this.age,
        @required this.height,
        @required this.weight
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()
      {
      Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios_new,
      ),
    ),
        title: Text('result'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text('gender:${ismale!?'male':'female'}', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          Text('age:$age', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          Text('height:$height', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          Text('weight:$weight', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          Text('result:$result', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),


            ]),
      ),
    );
  }
}
