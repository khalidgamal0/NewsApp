import 'package:bloc/bloc.dart';
import 'package:firstproject/layout/newsapp/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../moduels/Settings_screen/settings.dart';
import '../../../moduels/business/business.dart';
import '../../../moduels/scince/scince.dart';
import '../../../moduels/sports/sports.dart';
import 'package:firstproject/shared/network/remote/dio_heliper.dart';
import 'package:firstproject/shared/network/local/cache_helper.dart';

class newcubit extends Cubit<newstates>{
  newcubit():super(intialstate());
  static newcubit get(context){
    return BlocProvider.of(context);
  }
  int currentindex=0;
  List<BottomNavigationBarItem> bottomitem=[
      BottomNavigationBarItem(
    icon: Icon(
      Icons.business,
    ),
    label: 'Business',
  ),
      BottomNavigationBarItem(
  icon: Icon(
  Icons.sports,
  ),
  label: 'Sports',
  ),
      BottomNavigationBarItem(
      icon: Icon(
      Icons.science,
      ),
      label: 'Science',
      ),
      ];
  void changeindex(int?index){
    currentindex=index!;
    if(index==1){
      getSports();
    }else if(index==2){
      getScince();
    }
    emit(bottomvavigator());
  }

  List<Widget>Screens=[business(),sports(),scince()];

  List<dynamic>Business=[];
  void getbusiness(){
        emit(newsbussinceloadingstate());
        diohelper.getData(
            method_url:'v2/top-headlines',
            query:{
              'country':'eg',
              'category':'business',
              'apiKey':'d17edb0ca522454c92c8b7ba665a4b43',
            }
    ).then((value){
      // print(value.data['articles'][5]['title']);
          Business=value.data['articles'];
     print( Business[0]['title']);
     emit(newsbussincesuccessedstate());
        }).catchError((error){
      print(error.toString());
      emit(newsbussincefailstate(error));
        });
  }

  List<dynamic>Sports=[];
  void getSports(){
    emit(newssportsloadingstate());
    if(Sports.length==0){
      diohelper.getData(
          method_url:'v2/top-headlines',
          query:{
            'country':'eg',
            'category':'sports',
            'apiKey':'d17edb0ca522454c92c8b7ba665a4b43',
          }
      ).then((value){
        // print(value.data['articles'][5]['title']);
        Sports=value.data['articles'];
        print( Sports[0]['title']);
        emit(newssportssuccessedstate());
      }).catchError((error){
        print(error.toString());
        emit(newssportsfailstate(error));
      });
    }else{
      emit(newssportssuccessedstate());
    }

  }

  List<dynamic>Scince=[];
  void getScince(){
    emit(newsscinceloadingstate());
    if(Scince.length==0){
      diohelper.getData(
          method_url:'v2/top-headlines',
          query:{
            'country':'eg',
            'category':'science',
            'apiKey':'d17edb0ca522454c92c8b7ba665a4b43',
          }
      ).then((value){
        // print(value.data['articles'][5]['title']);
        Scince=value.data['articles'];
        print( Scince[0]['title']);
        emit(newsscincesuccessedstate());
      }).catchError((error){
        print(error.toString());
        emit(newsscincefailstate(error));
      });
    }else{
      emit(newsscincesuccessedstate());
    }

  }

  List<dynamic>search=[];
  void getsearch(String?value){
    emit(newsscinceloadingstate());
    search=[];
    diohelper.getData(
        method_url:'v2/everything',
        query:{
          'q':'$value',
          'apiKey':'d17edb0ca522454c92c8b7ba665a4b43',
        }
    ).then((value){
      // print(value.data['articles'][5]['title']);
      search=value.data['articles'];
      print( search[0]['title']);
      emit(newssearchsuccessedstate());
    }).catchError((error){
      print(error.toString());
      emit(newsscincefailstate(error));
    });
    emit(newsscincesuccessedstate());
  }

bool isdark=false;
  void ChangeMode({bool? fromshared}){
    if(fromshared!=null){
      isdark=fromshared;
      emit(newsappmodestate());
    }
    else{
      isdark= !isdark;
      cahe_helper.putbooldat(key:'isdark', value: isdark).then((value){
        emit(newsappmodestate());
      });

    }
  }
}