import 'package:flutter/material.dart';
import 'package:sjce_myclassroom/pages/admin.dart';
import 'package:sjce_myclassroom/pages/latestupdates.dart';
import 'package:sjce_myclassroom/utils/pdfview.dart';
import 'package:sjce_myclassroom/utils/webview.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: UserAccountsDrawerHeader(
              accountName: Text("CSE - 1st Year",style: TextStyle(color: Colors.deepOrange,fontSize: 25.0),),
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: ExactAssetImage('assets/images/jssstu.jpg'),
                      fit: BoxFit.contain)
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.timer,size: 30.0,),
            title: Text('Time Table',style: TextStyle(fontSize: 15.0)),
            subtitle: Text('Latest'),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> pdfview("https://firebasestorage.googleapis.com/v0/b/myclassroom-926c0.appspot.com/o/onlinepdf%2Ftime_table.pdf?alt=media&token=5b29d1d3-e0aa-47ac-8bb9-20f67098e617", "Time Table")));
            },
          ),
          ListTile(
            leading: Icon(Icons.calendar_today_rounded,size: 30.0,),
            title: Text('Calender of Events',style: TextStyle(fontSize: 15.0)),
            subtitle: Text("2020 - 21"),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> pdfview("https://firebasestorage.googleapis.com/v0/b/myclassroom-926c0.appspot.com/o/onlinepdf%2Fcalender_of_events.pdf?alt=media&token=554a8046-52f8-48fa-a198-1dda4a7f8211", "Calender of Events")));
            },
          ),
          ListTile(
            leading: Icon(Icons.new_releases_sharp,size: 30.0,),
            title: Text('Latest Updates',style: TextStyle(fontSize: 15.0)),
            subtitle: Text('Internet Connection Required'),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> LatestUpdates()));
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts_rounded,size: 30.0,),
            title: Text('Contact Teachers',style: TextStyle(fontSize: 15.0)),
            subtitle: Text('CSE' ),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> pdfview("https://firebasestorage.googleapis.com/v0/b/myclassroom-926c0.appspot.com/o/onlinepdf%2Fcontact_details.pdf?alt=media&token=be6d761d-75bd-4a18-b4bc-a6292dcbab65", "Contact Teachers")));
            },
          ),

          ListTile(
            leading: Icon(Icons.people,size: 30.0,),
            title: Text('Our Team',style: TextStyle(fontSize: 15.0)),
            subtitle: Text('Uniquota Developers Club'),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> WebViewContainer("https://www.uniquota.in/p/sjce-myclassroom-mobile-app.html")));
            },
          ),
          ListTile(
            leading: Icon(Icons.admin_panel_settings,size: 30.0,),
            title: Text('Admin Panel',style: TextStyle(fontSize: 15.0)),
            subtitle: Text('You are not an admin'),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> Admin()));
            },
          ),
          ListTile(
            leading: Icon(Icons.arrow_circle_down,size: 30.0,),
            title: Text('Update App',style: TextStyle(fontSize: 15.0)),
            subtitle: Text('Visit website for updates'),
            onTap: (){},
          ),
        ],
      ),


    );
  }
}
