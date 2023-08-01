import 'package:flutter/material.dart';
class Data {
  final String? name;
  final String? message;
  final String? lastseen;
  Data({this.name,this.lastseen,this.message});
}// data base needed
class watsapp extends StatelessWidget {

  List<Data>person=[
    Data(name: 'khalid gamal mohame',lastseen: 'last',message: 'how are you you are fine or no thank you'),
    Data(name: 'omar gamal mohame',lastseen: 'last',message: 'how are you you are fine or no thank you'),
    Data(name: 'nedaa gamal mohame',lastseen: 'last',message: 'how are you you are fine or no thank you'),
    Data(name: 'khalid gamal mohame',lastseen: 'last',message: 'how are you you are fine or no thank you'),
    Data(name: 'omar gamal mohame',lastseen: 'last',message: 'how are you you are fine or no thank you'),
    Data(name: 'nedaa gamal mohame',lastseen: 'last',message:'how are you you are fine or no thank you'),
    Data(name: 'khalid gamal mohame',lastseen: 'last',message:'how are you you are fine or no thank you'),
    Data(name: 'omar gamal mohame',lastseen: 'last',message: 'how are you you are fine or no thank you'),
    Data(name: 'nedaa gamal mohame',lastseen: 'last',message: 'how are you you are fine or no thank you'),
    Data(name: 'khalid gamal mohame',lastseen: 'last',message:'how are you you are fine or no thank you'),
    Data(name: 'omar gamal mohame',lastseen: 'last',message: 'how are you you are fine or no thank you'),
    Data(name: 'nedaa gamal mohame',lastseen: 'last',message:'how are you you are fine or no thank you'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 8,
        centerTitle: true,
        backgroundColor: Colors.green[600],
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.menu),
            SizedBox(
              width: 15,
            ),

          ],
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.camera_alt, color: Colors.white, size: 25),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              Icon(Icons.motion_photos_on_rounded),
              SizedBox(
                width: 15,
              ),
              Icon(Icons.signal_wifi_4_bar),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_comment),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'whatsapp',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 22),
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            color: Colors.green[600],
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.groups,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Chats',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          'Groups',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          'stats',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'calls',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

          ),
          SizedBox(height: 10),
       ListView.separated(
           itemBuilder: (context, index) => BUILDITEM(person[index]),
           separatorBuilder:(context, index) => SizedBox(height: 5,),
           itemCount: person.length,
           shrinkWrap: true,
           physics: NeverScrollableScrollPhysics(),)
        ]),
      ),
    );
  }
  Widget BUILDITEM (Data x)=>   Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              'https://cdn1.vectorstock.com/i/1000x1000/46/55/beautiful-woman-red-hair-in-frame-circular-avatar-vector-28634655.jpg'),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${x.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.9),
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                '${x.message}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 20) ,
            child: Text(
              '${x.lastseen}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
        )
      ],
    ),
  );
}
