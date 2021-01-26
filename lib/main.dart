import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController con=ScrollController();
  final itemSize = 300.0;
  List <String> images=["https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500","https://picsum.photos/250?image=9","https://googleflutter.com/sample_image.jpg"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
       appBar: AppBar(
         title:Text("Slider"),
         centerTitle: true,
         backgroundColor: Colors.red,
       ),
       body: Padding(
         padding: EdgeInsets.all(20),
         child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
               Expanded(
               child: ListView.builder(
                   controller: con,
                   itemExtent: itemSize,
                   itemCount:images.length,
                   itemBuilder: (BuildContext ctxt, int index) {
                   return new Image(
                         image:NetworkImage(images[index])
                      );
                   }
              ),
             ),
           // Image(image:NetworkImage('https://picsum.photos/250?image=9')),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
               RaisedButton(
                 color: Colors.red[400],
                 onPressed: (){
                 // con.animateTo(con.offset - itemSize,
                 // curve: Curves.linear,
                 // duration: Duration(milliseconds: 500));
                   if(con.offset==0)null;else
                      con.jumpTo(con.offset - itemSize);
                      },
                 child: Icon(
                   Icons.arrow_back
                 ),
               ),
               RaisedButton(onPressed: (){

                 // con.animateTo(con.offset + itemSize,
                 //     curve: Curves.linear,
                 //     duration: Duration(milliseconds: 500));
                     if (con.offset==600) null;else
                      con.jumpTo(con.offset + itemSize);
                    },
                 color: Colors.red[400],
                 child: Icon(
                 Icons.arrow_forward_outlined
               ),
               )
               ],
             ),
           Spacer(),
           ],
         ),
       ),

      ),
    );
  }
}