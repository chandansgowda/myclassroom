import 'package:flutter/material.dart';

class LatestUpdates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("SJCE My Classroom",style: TextStyle(fontWeight: FontWeight.bold),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepOrangeAccent, Colors.orangeAccent]
              )
          ),
        ),
      ),

      body: ListView(
        children: [
        _top(),
          ]
      ));

  }
}

_top(){
  return Container(
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0)
        )
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [

                SizedBox(width: 25.0,),
                Text('LATEST UPDATES',style: TextStyle(fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold),)
              ],
            ),
          ],
        ),
              ],
    ),
  );
}