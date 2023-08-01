import 'package:bloc/bloc.dart';
import 'package:firstproject/layout/homelayout/newlayout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../moduels/archive/archive.dart';
import '../../../../moduels/done/done.dart';
import '../../../../moduels/newtasks/newtask.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get(context){
    return BlocProvider.of(context);
  }
  int currentindex=0;
  List<Widget> screens=[newtask(),done(),archive()];
  List<String>title=['task','done','archive'];
  void ChangeIndex(int index){
    currentindex=index;
    emit(AppChangeIndexState());
  }
  Database?database;
  List<Map> task=[];
  List<Map> donetask=[];
  List<Map> archivetask=[];

  void createdatabase()async{
    await openDatabase(
        'khalid.db',
        version: 1,
        onCreate: (database,version){
          print('create db');
          database.execute('create table task(id integer primary key,time text,title text,date text,state text )')
              .then((value){
            print('table created');
          }).catchError((Error){
            print('error is${Error.toString()}');
          });
        },
        onOpen: (database){
          getDataFromDB(database);
          print('db opend');
        }
    ).then((value){
      database=value;
      emit(AppCreateDB());
    });
  }
  // insert
//    لان كله هناFUTTERهحذفها
   insertintodb({
    @required String? title,
    @required String?time,
    @required String? date,
  })
  async{
   await database!.transaction((txn){
      txn.rawInsert('insert into task(time,date,title,state)values("$time","$date","$title","new")').
      then((value){
        print('$value inserted successfully');
        emit(AppInsertDB());
        // عاوز اجيب الداتاالجديده بقا
        getDataFromDB(database);
      }).catchError((error){
        print('error is ${error.toString()}');
      });
      return Future(() => null);
    });
  }
  void getDataFromDB(database){
    task=[];
    donetask=[];
    archivetask=[];
    emit(ApploadingDB());
     database!.rawQuery('select * from task').then((value){
       value.forEach((element) {
        if(element['state']=='new')task.add(element);
        else if(element['state']=='archive')archivetask.add(element);
        else donetask.add(element);
      });

      emit(AppGetDB());
    });
  }

  void updateData({
    @required String? status,
    @required int? id,
  }) async
  {
    database!.rawUpdate(
      'UPDATE task SET state = ? where id = ?',
      ['$status', id],
    ).then((value)
    {
      getDataFromDB(database);
      emit(AppupdateDB());
    });
  }

  void deleteData({
    @required int? id,
  }) async
  {
    database!.rawDelete('DELETE FROM task WHERE id = ?', [id])
        .then((value){
      getDataFromDB(database);
      emit(AppdeleteDB());
    });

  }

  bool showbottom=false;
  IconData fabicon=Icons.add;
  void Changebottomshow({
    @required bool? isshow,
    @required IconData? icon,
  }){
    showbottom=isshow!;
    fabicon=icon!;
    emit(AppChangebottomshow());
  }

}