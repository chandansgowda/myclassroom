import 'package:flutter/material.dart';
import 'package:sjce_myclassroom/ui/floatingbutton.dart';

class Chemistry extends StatelessWidget {
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
              SizedBox(height: 10.0,),
            Row(
              children: [
                Container(
                  color: Colors.deepOrangeAccent,
                )
              ],
            )
            ]
        ),
        floatingActionButton: HomeButton(),);

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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(width: 75.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Text('CHEMISTRY',style: TextStyle(fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
