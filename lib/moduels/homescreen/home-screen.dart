import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.amber,
        backgroundColor: Colors.teal,
        leading: Icon(
          Icons.menu,
        ),
        title: Text('FIRST APP'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("hkskhkshkhskhs");
              }),

          Icon(Icons.nat_sharp),
        ],
      ),
      body: Column(
        children: [
          Padding(

            padding: const EdgeInsets.all(50.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(topStart:Radius.circular(50)),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,//عشان البوردر يبان
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Image(
                    image: NetworkImage(
                        'https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg'),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.black.withOpacity(.7),
                    width: 200,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'FLOWER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
