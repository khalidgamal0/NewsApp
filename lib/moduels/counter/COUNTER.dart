import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'BLOCK/counterstates.dart';
import 'BLOCK/cubit.dart';

class counter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //countercubit x=BlocProvider.of(context);//   دا اوبجكت منه هو مختلف شويه له حاله خاصه
    return BlocProvider(
      create: (BuildContext context)=>countercubit(),
      child: BlocConsumer<countercubit,countrestates>
        (
        listener: (context,state ){
          if(state is initialstate){}
          if(state is mincestate){
            print('mince state is ${state.counter}');
          }
          if(state is plusstate){
            print('add state is ${state.counter}');
          }
        },
        builder: (context,stste )
        {
        return  Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                  countercubit.get(context).mince();
                  }, child: Text('mince',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '${countercubit.get(context).counter}',
                      style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),),
                  ),
                  TextButton(onPressed: (){
                    countercubit.get(context).plus();

                  }, child: Text('add',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),)),
                ]),
          ),
        );},

      ),
    );
  }

}


