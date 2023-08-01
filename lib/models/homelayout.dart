import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstproject/shared/cubit/cubit.dart';
import 'package:firstproject/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../moduels/archive/archive.dart';
import '../moduels/done/done.dart';
import '../moduels/newtasks/newtasks.dart';
import '../shared/commponent/commponent.dart';
import '../shared/commponent/constent.dart';

class homelayout extends StatelessWidget {
  var scafoldkey=GlobalKey<ScaffoldState>();
  var formkey=GlobalKey<FormState>();

  var titlecontroller=TextEditingController();
  var timecontroller=TextEditingController();
  var datecontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..createdatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
       listener: (context, state) {
         if(state is AppInserteDatabase){
           Navigator.pop(context);
         }
       },
        builder: (context, state) {
       AppCubit cubit=  AppCubit.get(context);
          return Scaffold(
            key: scafoldkey,
            appBar:AppBar (
              title:Text(cubit.title[cubit.currentIndex]),
            ),
            body:ConditionalBuilder(
              condition:state is! AppGetDatabaseloading,
              builder: (context)=>cubit.screens[cubit.currentIndex],
              fallback:(context)=>Center(child: CircularProgressIndicator()),

            ),
            floatingActionButton:FloatingActionButton(
                onPressed: ()
                {
                  if(cubit.isbottomsheetshow){
                    if(formkey.currentState!.validate()){
                      cubit.insertdatabase(title: titlecontroller.text, time: timecontroller.text, date:datecontroller.text);
                      // insertdatabase(date:datecontroller.text,time:timecontroller.text,title: titlecontroller.text).then((value){
                      //   getDataFromDataBase(database).then((value) {
                      //     Navigator.pop(context);
                      //     // setState(() {
                      //     //   isbottomsheetshow=false;
                      //     //   fabicon=Icons.edit;
                      //     //   tasks=value;
                      //     //   print(tasks);
                      //     // });
                      //
                      //   });
                      // });

                    }
                  }
                  else{
                    scafoldkey.currentState!.showBottomSheet((context) =>
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20),
                          child: Form(
                            key: formkey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaulttextformfield(
                                  controller: titlecontroller,
                                  labeltext: 'title',
                                  type: TextInputType.text,
                                  prefixIcon: Icons.title,
                                  validate: (value){
                                    if (value.isEmpty){
                                      return('title must not empty');}},),
                                SizedBox(height: 15,),
                                defaulttextformfield(
                                  controller: timecontroller,
                                  labeltext: 'time',
                                  type: TextInputType.datetime,
                                  prefixIcon: Icons.watch,
                                  onTap: (){
                                    showTimePicker(context: context,
                                        initialTime: TimeOfDay.now())
                                        .then((value) {
                                      timecontroller.text=value!.format(context).toString();
                                    });},
                                  validate: (value){
                                    if (value.isEmpty){
                                      return('time must not empty');}},),
                                SizedBox(height: 15,),
                                defaulttextformfield(
                                  controller: datecontroller,
                                  labeltext: 'date',
                                  type: TextInputType.datetime,
                                  prefixIcon: Icons.view_day,
                                  onTap: (){
                                    showDatePicker(context: context,
                                        initialDate:DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate:DateTime.parse('2023-05-03')
                                    ).then((value){
                                      datecontroller.text=DateFormat.yMMMd().format(value!);
                                    });
                                  },
                                  validate: (value){
                                    if (value.isEmpty){
                                      return('time must not empty');}},),
                              ],
                            ),
                          ),
                        ),
                        elevation: 20).
                    closed.then((value){
                     cubit.ChangeBottomSheetShow(
                         isshow: false,
                         icon: Icons.edit
                     );
                    });
                    cubit.ChangeBottomSheetShow(
                        isshow: true,
                        icon: Icons.add
                    );
                  }
                },
                child: Icon(cubit.fabicon)),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex:cubit.currentIndex ,
                onTap: (index){
                  cubit.ChangeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(icon:Icon(Icons.task),label: 'new task', ),
                  BottomNavigationBarItem(icon:Icon(Icons.task_alt),label: 'done' ),
                  BottomNavigationBarItem(icon:Icon(Icons.archive),label: 'archived' ),

                ]),

          );
        },
      ),
    );

  }



}

// try{
//   var name= await getname();
//   print(name);
//   print('marim');
//   throw('error mes!!!!!');
// }catch(error){
//   print('error is$error');
// }
// الطريقه دي مش احسن حاجه لانه ممكن يتخطي الترتيب لو العمليه الاولي هتتاخر علي عكس then

