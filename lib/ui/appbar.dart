import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("SJCE My Classroom",style: TextStyle(fontWeight: FontWeight.bold),),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepOrangeAccent, Colors.orangeAccent]
            )
        ),
      ),
    );
  }
}
