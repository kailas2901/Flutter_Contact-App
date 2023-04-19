import 'package:contact_app/src/pages/home_page.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contacts",
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}