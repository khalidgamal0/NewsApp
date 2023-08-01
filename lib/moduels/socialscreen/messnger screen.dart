import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class messenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://w1.pngwing.com/pngs/793/504/png-transparent-avatar-icon-ninja-samurai-icon-design-red-smile-circle-thumbnail.png')    ),
            SizedBox(
              width: 7.5,
            ),
            Text(
              'Chats',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: 17.5,
                  ))),
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 17.5,
                  )))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15,
                    ),
                    Text('search'),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildstory(),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
                  itemCount: 10,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => builditem(),//عملية اضافة العنصر الي اليست
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),//الفواصل بين كل عنصر والاخر
                itemCount: 15,//عدد العناصر التي يتم بنائها
              )
            ],
          ),
        ),
      ),
    );
  }

  // 1 build item
  Widget builditem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage:NetworkImage('https://w1.pngwing.com/pngs/793/504/png-transparent-avatar-icon-ninja-samurai-icon-design-red-smile-circle-thumbnail.png'  ),
              ),  Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 2, end: 2),
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Khalid Gamal Mohamed ali ali saleh agwa',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'heloo how are you heloo how are youheloo how are youheloo how are you',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue)),
                    ),
                    Text('02.00 pm'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      );
  Widget buildstory() {
    return Container(
      width: 60,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30,
                  backgroundImage:NetworkImage('https://w1.pngwing.com/pngs/793/504/png-transparent-avatar-icon-ninja-samurai-icon-design-red-smile-circle-thumbnail.png')
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 2, end: 2),
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Expanded(
            child: Text(
              'khalid gamal mohamed ali',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
