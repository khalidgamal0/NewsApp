import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstproject/layout/homelayout/newlayout/cubit/cubit.dart';
import 'package:flutter/material.dart';

import '../../moduels/webview/webview.dart';

Widget defaultbutton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isuppercase = true,
  @required String text = 'login',
  @required Function()? function,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        height: 50,
        onPressed: function,
        child: Text(
          isuppercase ? text.toUpperCase() : text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaulttextformfield({
  required TextEditingController? controller,
  required String? labeltext,
  required IconData? prefixIcon,
  IconData? suffixIcon,
  required TextInputType? type,
  bool obscureText = false,
  VoidCallback? onTap,
  Function()? suffixpressed,
  Function(String)? onchanged,
  Function(String)? onsubmitted,
  FormFieldValidator? validate,
}) {
  return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labeltext,
          suffixIcon: suffixIcon != null
              ? IconButton(onPressed: suffixpressed, icon: Icon(suffixIcon))
              : null,
          border: OutlineInputBorder(),
          prefixIcon: Icon(prefixIcon)),
      obscureText: obscureText,
      keyboardType: type,
      onTap: onTap,
      onFieldSubmitted: onsubmitted,
      onChanged: onchanged,
      validator: validate,
    );
}

Widget itemtaskbuilder(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text('${model['time']}'),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: 'done', id: model['id']);
                },
                icon: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () {
                  AppCubit.get(context)
                      .updateData(status: 'archive', id: model['id']);
                },
                icon: Icon(
                  Icons.archive,
                  color: Colors.black45,
                )),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
    );

Widget ConditionalBuild({required List<Map>? task}) => ConditionalBuilder(
      condition: task!.length > 0,
      builder: (context) => ListView.separated(
          itemBuilder: (context, index) =>
              itemtaskbuilder(task[index], context),
          separatorBuilder: (context, index) => mydivider(),
          itemCount: task!.length),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              'No Tasks Yet, Please Add Some Tasks',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );

Widget buildarticleitem(article, context) => InkWell(
      onTap: () {
        NavigateTo(context, webview(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage('${article['urlToImage']}'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget mydivider() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey[300],
    );

Widget articalConditionalbuilder(list) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildarticleitem(list[index], context),
          separatorBuilder: (context, index) => mydivider(),
          itemCount: list.length),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );

void NavigateTo(context, Widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
}
