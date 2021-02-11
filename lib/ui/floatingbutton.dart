import 'package:flutter/material.dart';
import 'package:sjce_myclassroom/pages/HomePage.dart';
import 'package:sjce_myclassroom/utils/pdfview.dart';

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepOrange,
      hoverColor: Colors.deepOrangeAccent,
      child: Icon(Icons.home,),
      onPressed: () {
      },
    );
  }
}
