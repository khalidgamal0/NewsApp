import 'package:firstproject/shared/commponent/commponent.dart';
import 'package:firstproject/shared/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/commponent/constent.dart';
import '../../shared/cubit/states.dart';

class newtasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
     listener: (context, state) {},
      builder: (context, state) {
      var tasks= AppCubit.get(context).tasks;
      return  ListView.separated(
            itemBuilder: (context,index)=>itemtaskbuilder(tasks[index],context),
            separatorBuilder:(context,index)=>Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
            itemCount: tasks!.length);
      },
    );
  }
}
