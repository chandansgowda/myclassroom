import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class myData {
  String name, message, profession;

  myData(this.name, this.message, this.profession);
}

class LatestUpdates extends StatefulWidget {
  @override
  _LatestUpdatesState createState() => _LatestUpdatesState();
}

class _LatestUpdatesState extends State<LatestUpdates> {
  List<myData> allData = [];

  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    ref.child('Updates').once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      allData.clear();
      for (var key in keys) {
        myData d = new myData(
          data[key]['name'],
          data[key]['message'],
          data[key]['profession'],
        );
        allData.add(d);
      }
      setState(() {
        print('Length : ${allData.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Latest Updates'),
      ),
      body: new Container(
          child: allData.length == 0
              ? new Text(' Please wait... Its taking longer than usual. Check your internet connection..')
              : new ListView.builder(
            itemCount: allData.length,
            itemBuilder: (_, index) {
              return UI(
                allData[index].name,
                allData[index].profession,
                allData[index].message,
              );
            },
          )),
    );
  }

  Widget UI(String name, String profession, String message) {
    return new Card(
      elevation: 10.0,
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text('Update : $message',style: Theme.of(context).textTheme.title,),
            new Text('Posted by : $name'),
            new Text('Profession : $profession'),

          ],
        ),
      ),
    );
  }
}
