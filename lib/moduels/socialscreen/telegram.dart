import 'package:flutter/material.dart';
class DB{
  final String? name;
  final String? messege;
  final String? lastseen;
  DB({
   this.name,
   this.messege,
    this.lastseen,
  });
}
class telegram extends StatelessWidget {

  List <DB> item=[
    DB(name:'Khalid GAMAL',messege:'Hello How Are You you are a good man',lastseen: '10.56 AM' ),
    DB(name:'MOhamed GAMAL',messege:'Hello How Are You you are a good man',lastseen: '11.24 AM' ),
    DB(name:'Maher GAMAL',messege:'Hello How Are You you are a good man',lastseen: '8.26 AM' ),
    DB(name:'Khalid GAMAL',messege:'Hello How Are You you are a good man',lastseen: '9.05 AM' ),
    DB(name:'Khalid GAMAL',messege:'Hello How Are You you are a good man',lastseen: '10.56 AM' ),
    DB(name:'MOhamed GAMAL',messege:'Hello How Are You you are a good man',lastseen: '11.24 AM' ),
    DB(name:'Maher GAMAL',messege:'Hello How Are You you are a good man',lastseen: '8.26 AM' ),
    DB(name:'Khalid GAMAL',messege:'Hello How Are You you are a good man',lastseen: '9.05 AM' ),
    DB(name:'Khalid GAMAL',messege:'Hello How Are You you are a good man',lastseen: '10.56 AM' ),
    DB(name:'MOhamed GAMAL',messege:'Hello How Are You you are a good man',lastseen: '11.24 AM' ),
    DB(name:'Maher GAMAL',messege:'Hello How Are You you are a good man',lastseen: '8.26 AM' ),
    DB(name:'Khalid GAMAL',messege:'Hello How Are You you are a good man',lastseen: '9.05 AM' ),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Telegrame'),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Icon(Icons.search),
        ),],
      ),
     body:ListView.separated(
         itemBuilder: (context ,index)=>btele(item[index]),
         separatorBuilder:(context ,index)=>Padding(
           padding: const EdgeInsets.only(right: 16,left:70),
           child: Container(
             height: 1,
             color: Colors.grey[350],),
         ),
         itemCount: item.length,
     ),
    );
  }
  Widget btele (DB x)=> Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/male.png'),
            radius: 20,),
          SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${x.name}', maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(.9),
                    )),
                SizedBox(height: 5.0,),
                Text('${x.messege} ',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey),),
              ],),
          ),
          SizedBox(width: 15,),
          Text('${x.lastseen}', style: TextStyle(color: Colors.grey, fontSize: 18),),
        ]),
  );


}
