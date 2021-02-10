import 'package:flutter/material.dart';
import 'package:sjce_myclassroom/Widgets/MyDashboard.dart';
import 'package:sjce_myclassroom/ui/drawer.dart';
import 'package:sjce_myclassroom/ui/floatingbutton.dart';
import 'package:sjce_myclassroom/utils/imageview.dart';
import 'package:sjce_myclassroom/utils/pdfview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SJCE My Classroom",style: TextStyle(fontWeight: FontWeight.bold),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepOrangeAccent, Colors.orangeAccent]
              )
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: MyDashboard(),
      floatingActionButton: MyFloatingButton(),
    );
  }
}