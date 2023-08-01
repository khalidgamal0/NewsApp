import 'dart:math';
import 'package:firstproject/moduels/result-screen/result-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class calculater extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CalaCubit(),
      child: BlocConsumer<CalaCubit,CalcStates>(
        listener: (context, state) {
          if(state is claagemince){
            print('age is${state.age}');
          }
          if(state is claageplus){
            print('age is${state.age}');
          }
        },
        builder: (context, state) {
          var calccubit=CalaCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('BMI CALCULATER'),
            ),
            body: Column(children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              calccubit.Ismale(istype: true);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: calccubit.ismale ?  Colors.blue:Colors.grey[400] ,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage('assets/images/male.png'),
                                    width: 90,
                                    height: 90,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'MALE',
                                    style: TextStyle(fontWeight: FontWeight.w900),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              calccubit.Ismale(istype:false);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: calccubit.ismale ?Colors.grey[400]: Colors.blue ,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage('assets/images/female.png'),
                                    width: 90,
                                    height: 90,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'FEMALE',
                                    style: TextStyle(fontWeight: FontWeight.w900),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400],
                      ),
                      child:
                      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text(
                          'HEIGHT',
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '${calccubit.height.round()}',
                              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'CM',
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        Slider(
                            value: calccubit.height,
                            max: 220,
                            min: 70,
                            onChanged: (value) {
                             calccubit.changeheight(value);
                            })
                      ]),
                    ),
                  )),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[400],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'WEIGHT',
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  '${calccubit.weight.round()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900, fontSize: 30),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                        onPressed: () {
                                          calccubit.weightmince();
                                        },
                                        child: Icon(
                                          Icons.remove,
                                        ),
                                        heroTag:' w-',
                                        mini: true),
                                    FloatingActionButton(
                                        onPressed: () {
                                          calccubit.weightpluse();
                                        },
                                        child: Icon(Icons.add),
                                        heroTag:' w+',
                                        mini: true)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[400],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'AGE',
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  '${calccubit.age.round()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900, fontSize: 30),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FloatingActionButton(
                                        onPressed: () {
                                          calccubit.agemince();
                                        },
                                        child: Icon(
                                          Icons.remove,
                                        ),
                                        heroTag:' a-',
                                        mini: true),
                                    FloatingActionButton(
                                        onPressed: () {
                                          calccubit.agepluse();
                                        },
                                        child: Icon(Icons.add),
                                        heroTag:'a+',
                                        mini: true)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Container(
                  color: Colors.blue,
                  width: double.infinity,
                  child: MaterialButton(
                    height: 48,
                    onPressed: () {
                      double result = calccubit.weight / pow(calccubit.height / 100, 2);
                      print(result.round());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:(context){return bmiresult(
                              ismale:calccubit.ismale,
                              age:calccubit.age.round(),
                              result: result.round(),
                              height:calccubit.height.round(),
                              weight:calccubit.weight.round(),
                            );},

                          ));
                    },
                    child: Text(
                      'Calculate',
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ]),
          );
        },
      ),
    );
  }
}
