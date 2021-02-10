import 'package:flutter/material.dart';
import 'package:sjce_myclassroom/pages/latestupdates.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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

    );
  }
}
