import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/homelayout/newlayout/cubit/cubit.dart';
import '../../layout/homelayout/newlayout/cubit/states.dart';
import '../../shared/commponent/commponent.dart';
import '../../shared/commponent/constent.dart';

class archive extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var task=AppCubit.get(context).archivetask;
        return ConditionalBuild(task: task);
      },
    );
  }
}
