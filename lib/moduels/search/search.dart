import 'package:firstproject/layout/newsapp/cubit/cubit.dart';
import 'package:firstproject/layout/newsapp/cubit/states.dart';
import 'package:firstproject/shared/commponent/commponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class search extends StatelessWidget {
var searchcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newcubit,newstates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<dynamic> list=newcubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaulttextformfield(
                controller: searchcontroller,
                labeltext: 'search',
                prefixIcon:Icons.search ,
                type:TextInputType.text,
                validate: (value) {
                  if (value.isEmpty){
                    print('search must not empty');
                  }
                  return null;
                },
                onchanged:(value){
                  newcubit.get(context).getsearch(value);
                }
              ),
            ),
            Expanded(child:articalConditionalbuilder(list)),
          ]),
        );
      },
    );
  }
}
