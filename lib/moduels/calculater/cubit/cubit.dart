import 'package:bloc/bloc.dart';
import 'package:firstproject/moduels/calculater/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalaCubit extends Cubit<CalcStates>{
  CalaCubit():super(clacintial());
  static CalaCubit get(context){
    return BlocProvider.of(context);
  }
  //
  bool ismale = true;
void Ismale({bool? istype}){
  ismale=istype!;
  emit(clacType());
}
  double height=120;
 void changeheight(double?hei){
  height=hei!;
  print(hei);
  emit(clacheight());
}
  double weight = 69;
void weightmince(){
  weight--;
  emit(claweightmince());
}
  void weightpluse(){
    weight++;
    emit(claweightplus());
  }
  double age = 20;
  void agemince(){
    age--;
    emit(claagemince(age: age.round()));
  }
  void agepluse(){
    age++;
    emit(claageplus(age: age.round()));
  }
}