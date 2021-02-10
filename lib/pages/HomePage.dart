import 'package:flutter/material.dart';
import 'package:sjce_myclassroom/Widgets/MyDashboard.dart';
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("CSE - 1st Year",style: TextStyle(color: Colors.deepOrange,fontSize: 25.0),),
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: ExactAssetImage('assets/images/jssstu.jpg'),
                      fit: BoxFit.contain)
              ),
            ),
            ListTile(
              leading: Icon(Icons.timer,size: 30.0,),
              title: Text('Time Table',style: TextStyle(fontSize: 15.0)),
              subtitle: Text('v7.0'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.calendar_today_rounded,size: 30.0,),
              title: Text('Calender of Events',style: TextStyle(fontSize: 15.0)),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.file_copy_rounded,size: 30.0,),
              title: Text('Syllabus Copies',style: TextStyle(fontSize: 15.0)),
              subtitle: Text('First Sem Subjects'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.contacts_rounded,size: 30.0,),
              title: Text('Contact Teachers',style: TextStyle(fontSize: 15.0)),
              //subtitle: Text('Teachers contacts' ),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.arrow_circle_down,size: 30.0,),
              title: Text('Update App',style: TextStyle(fontSize: 15.0)),
              subtitle: Text('Your App is Updated'),
              onTap: (){},
            )
          ],
        ),

      ),
      body: MyDashboard(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        hoverColor: Colors.deepOrangeAccent,
        child: Icon(Icons.home,),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=> pdfview()));
        },
      ),
    );
  }
}