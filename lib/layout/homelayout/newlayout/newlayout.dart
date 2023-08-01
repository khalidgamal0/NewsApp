import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstproject/layout/homelayout/newlayout/cubit/cubit.dart';
import 'package:firstproject/layout/homelayout/newlayout/cubit/states.dart';
import 'package:firstproject/moduels/archive/archive.dart';
import 'package:firstproject/moduels/done/done.dart';
import 'package:firstproject/moduels/newtasks/newtasks.dart';
import 'package:firstproject/shared/commponent/constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../../../moduels/newtasks/newtask.dart';
import '../../../shared/commponent/commponent.dart';

class newlayout extends StatelessWidget {


  var scafoldkey=GlobalKey<ScaffoldState>();
  var formkey=GlobalKey<FormState>();

  var titlecontroller=TextEditingController();
  var timecontroller=TextEditingController();
  var datecontroller=TextEditingController();



  @override
  Widget build(BuildContext context) {
  return BlocProvider(
    create: (context) => AppCubit()..createdatabase(),
    child: BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {
        if (state is AppInsertDB){  Navigator.pop(context);}
      },
      builder: (context, state) {
        AppCubit ncubit=AppCubit.get(context);
      return  Scaffold(
          key: scafoldkey,
          appBar: AppBar(
            title: Center(child: Text('${ncubit.title[ncubit.currentindex]}')),
          ),
          body:ConditionalBuilder(
            condition: state is! ApploadingDB,
            builder: (context) => ncubit.screens[ncubit.currentindex],
            fallback: ((context) => Center(child: CircularProgressIndicator())),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex:ncubit.currentindex,
            elevation: 0,
            onTap: (index){
              ncubit.ChangeIndex(index);
            },
            items: [
              BottomNavigationBarItem(icon:Icon(Icons.task),label:'tasks',),
              BottomNavigationBarItem(icon:Icon(Icons.done_all_outlined),label:'done',),
              BottomNavigationBarItem(icon:Icon(Icons.archive),label:'archive',),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              if(ncubit.showbottom){
                if(formkey.currentState!.validate())
                {
                  ncubit.insertintodb(title: titlecontroller.text, time: timecontroller.text, date: datecontroller.text);
                  ncubit.Changebottomshow(isshow: false, icon:Icons.edit);
                  // insertintodb(
                  //   title: titlecontroller.text,
                  //   date: datecontroller.text,
                  //   time: timecontroller.text,
                  // ).then((value) => {
                  //   getDataFromDB(database).then((value) => {
                  //     Navigator.pop(context),
                  //     // setState(() {
                  //     // showbottom=false;
                  //     // fabicon=Icons.edit;
                  //     // task=value;
                  //     // }),
                  //   })
                  // });
                }
              }else{
                scafoldkey.currentState!.showBottomSheet((context) =>Padding(
                  padding: const EdgeInsets.all(20),
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
                              if(value.isEmpty){
                                return('title must not empty');
                              }}),
                        SizedBox(
                            height:15),

                        defaulttextformfield(
                            controller:timecontroller,
                            labeltext: 'time',
                            type: TextInputType.text,
                            prefixIcon: Icons.watch_later_outlined,
                            validate: (value){
                              if(value.isEmpty){
                                return('time must not empty');
                              }
                            },
                            onTap: (){
                              showTimePicker(
                                  context: context,
                                  initialTime:TimeOfDay.now()
                              ).then((value){
                                timecontroller.text=value!.format(context);

                              });
                            }
                        ),
                        SizedBox(
                            height:15),
                        defaulttextformfield(
                            controller:datecontroller,
                            labeltext: 'date',
                            type: TextInputType.text,
                            prefixIcon: Icons.date_range_outlined,
                            validate: (value){
                              if(value.isEmpty){
                                return('date must not empty');
                              }
                            },
                            onTap: (){
                              showDatePicker(context: context,
                                  initialDate:DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2023-05-03'))
                                  .then((value){
                                datecontroller.text=DateFormat.yMMMd().format(value!);
                              });
                            }
                        ),
                      ],
                    ),
                  ),
                ))
                    .closed.then((value){
                  ncubit.Changebottomshow(isshow: false, icon: Icons.edit);
                });
                ncubit.Changebottomshow(isshow: true, icon: Icons.add);
              }
            },
            child: Icon(ncubit.fabicon),
          ),
        );
      },

    ),
  );
  }

}



