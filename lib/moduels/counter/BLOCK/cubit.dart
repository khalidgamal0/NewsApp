import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counterstates.dart';

class countercubit extends Cubit<countrestates>{
  countercubit():super(initialstate());
  static countercubit get(context){
    return BlocProvider.of(context);
  }
  void plus(){
    counter++;
    emit(plusstate(counter));
  }
  void mince(){
    counter--;
    emit(mincestate(counter));
  }
int counter=1;

}