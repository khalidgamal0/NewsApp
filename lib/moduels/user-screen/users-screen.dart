import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class usermodel{
  final int? id;
  final String? name;
  final String? phone;

  usermodel(
    this.id,
    this.name,
    this.phone,
);



}

class users extends StatelessWidget {
  List<usermodel> user=[
  usermodel(
    5,'khalid','01066191106'
  ),
    usermodel(
        5,'khalid','01066191106'
    ),usermodel(
        5,'khalid','01066191106'
    ),usermodel(
        5,'khalid','01066191106'
    ),usermodel(
        5,'khalid','01066191106'
    ),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('users'),
      ),
      body: ListView.separated
        (itemBuilder:(context ,y)=>BUILDITEM(user[y]),
          separatorBuilder:(x ,index)=>Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
          itemCount: user.length) ,
    );

  }
  Widget BUILDITEM(usermodel x)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(children: [
      CircleAvatar(
        radius: 15,
        backgroundColor: Colors.blue,
        child: Text('${x.id}',
          style: TextStyle(
            color: Colors.white,
            fontWeight:FontWeight.bold,
          ),),
      ),
      SizedBox(width: 15,),
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('${x.name}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          Text('${x.phone}',
            style: TextStyle(
                color: Colors.grey[300]
            ),)
        ],)
    ]),
  );
}
