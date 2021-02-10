import 'package:flutter/material.dart';
import 'package:sjce_myclassroom/pages/HomePage.dart';


void main(){
  runApp(MaterialApp(
    title: "SJCE My Classroom",
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(primaryColor: Colors.orange),

  ));
}



