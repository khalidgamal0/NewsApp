import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/newsapp/cubit/cubit.dart';
import '../../layout/newsapp/cubit/states.dart';
import '../../shared/commponent/commponent.dart';


class scince extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newcubit,newstates>(
      listener: (context, state) {},
      builder:(context, state) {
        var list=newcubit.get(context).Scince;
        return articalConditionalbuilder(list);
      },
    );
  }
}
