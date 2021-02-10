import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sjce_myclassroom/subjects/20ch110.dart';
import 'package:sjce_myclassroom/subjects/20ch12l.dart';
import 'package:sjce_myclassroom/subjects/20cv110.dart';
import 'package:sjce_myclassroom/subjects/20ec110.dart';
import 'package:sjce_myclassroom/subjects/20hu120.dart';
import 'package:sjce_myclassroom/subjects/20hu130.dart';
import 'package:sjce_myclassroom/subjects/20ma110.dart';
import 'package:sjce_myclassroom/subjects/20me120.dart';
// import 'package:sjce_myclassroom/subjects/20ch110.dart';
// import 'package:sjce_myclassroom/subjects/20cv110.dart';
// import 'package:sjce_myclassroom/subjects/20ec110.dart';
// import 'package:sjce_myclassroom/subjects/20hu120.dart';
// import 'package:sjce_myclassroom/subjects/20hu130.dart';
// import 'package:sjce_myclassroom/subjects/20ma110.dart';
// import 'package:sjce_myclassroom/subjects/20me120.dart';

_gridItem(icon, text, context, path ){
  return Column(
    children: [
      InkWell(
        onTap: (){
         Navigator.push(context,
             MaterialPageRoute(builder: (context)=> path));
       },
        child: CircleAvatar(
          radius: 25.0,
          child: Icon(
            icon,size: 33.0,
            color: Colors.white,
          ),
          backgroundColor: Colors.deepOrangeAccent.withOpacity(0.9),
        ),
      ),
      SizedBox(height: 10.0,),
      Text(text, style: TextStyle(
        fontWeight: FontWeight.bold,
      ),)
    ],

  );
}

class MyDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _top(),
        SizedBox(height: 20.0,),
        Padding(
            padding: EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Subjects',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),)
            ],
          ),
        ),
        SizedBox(height: 30.0,),
        Container(
          height: 300.0,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 3/2),
          children: [
            _gridItem(Icons.calculate_sharp, '20MA110', context, Mathematics()),
            _gridItem(Icons.emoji_objects_sharp, '20EC110', context, Electronics()),
            _gridItem(Icons.donut_small_sharp, '20CH110', context, Chemistry() ),
            _gridItem(Icons.explore_sharp, '20CV110', context, Mechanics() ),
            _gridItem(Icons.design_services_sharp, '20ME120', context, Graphics() ),
            _gridItem(Icons.font_download_sharp, '20HU130', context, English()),
            _gridItem(Icons.engineering_sharp, '20HU120', context, Innovation() ),
            _gridItem(Icons.dry, '20CH12L', context, ChemistryLab()),
          ],),
        ),
        Padding(padding: EdgeInsets.all(16.0),
        child: Center(
          child:
            Text('Made with ❤ by Chandan',style: TextStyle(fontSize: 10.0,),)
          ,
        ),)
      ],

    );
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
                Icon(Icons.arrow_circle_down),
                SizedBox(width: 10.0,),
                Text('One stop for all your classroom updates',style: TextStyle(fontSize: 12.0, color: Colors.white),)
              ],
            ),
            IconButton(
                icon: Icon(Icons.arrow_circle_down),
                onPressed: (){})
          ],
        ),
        SizedBox(height: 30.0,),
        TextField(
          decoration: InputDecoration(
            hintText: "Search",
            fillColor: Colors.white,
            filled: true,
            suffixIcon: Icon(Icons.filter_list),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0)
          ),
        )
      ],
    ),
  );
}



