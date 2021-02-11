import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sjce_myclassroom/pages/HomePage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: "SJCE My Classroom",
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(primaryColor: Colors.orange),

  ));
}



