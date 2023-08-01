import 'package:bloc/bloc.dart';
import 'package:firstproject/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../moduels/archive/archive.dart';
import '../../moduels/done/done.dart';
import '../../moduels/newtasks/newtasks.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(intialstate());
  static AppCubit get(context){
    return BlocProvider.of(context);
  }
  int currentIndex=0;
  List<Widget>screens=
  [
    newtasks(),
    done(),
    archive()
  ];
  List<String>title=
  ['newtasks',
    'done',
    'archive'
  ];
  void ChangeIndex(int index){
    currentIndex=index;
    emit(AppChangeBottomNavState());
  }
  Database? database;
  List<Map> tasks=[];
  void createdatabase(){
    openDatabase(
        'kha.db',
        version: 1,
        onCreate: (database,version){
          print('db created');
          database.execute('create table tasks(id integer primary key,title text,date text,time text,stats text)').then((value){
            print('table created');
          }).catchError((Error){
            print('error is${Error.toString()}');
          });
        },
        onOpen: (database){
          getDataFromDataBase(database).then((value) {
            tasks=value;
             print(tasks);
             emit(AppGetDatabase());
          });
          print('db opened');
        }
    ).then((value){
      database=value;
      emit(AppCreateDatabase());
    });
  }

   insertdatabase({
    @required String? title,
    @required String?time,
    @required String? date,
  }
      ) async{
     await database!.transaction((txn){
      txn.rawInsert('insert into tasks(title,date,time,stats) values("$title","$date","$time","new")')
          .then((value){
        print('$value inserted succsessfuly');
        emit(AppInserteDatabase());
        getDataFromDataBase(database).then((value) {
          tasks=value;
          print(tasks);
          emit(AppGetDatabase());
        });
      }).catchError((erro){print('the error is${erro.toString()}');});
      return Future(() => null);
    }
    );
  }

  Future<List<Map>> getDataFromDataBase(database)async{
    emit(AppGetDatabaseloading());
    return await database!.rawQuery('select * from tasks');
  }
  bool isbottomsheetshow=false;
  IconData fabicon=Icons.edit;
  void ChangeBottomSheetShow({@required bool? isshow, @required IconData? icon})
  {
    isbottomsheetshow=isshow!;
    fabicon=icon!;
    emit(AppChangeBottomsheetState());
  }
}