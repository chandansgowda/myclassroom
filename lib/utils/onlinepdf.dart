import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Modal{
  String link,name;
  Modal(this.link,this.name);
}

// ignore: camel_case_types
class TimeTable extends StatefulWidget {
  // final String title;
  // final String db_name;
  // FirebasePdf(this.title, this.db_name)

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<Modal> itemList=List();
  final mainReference = FirebaseDatabase.instance.reference().child("TimeTable");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TimeTable'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepOrangeAccent, Colors.orangeAccent]
              )
          ),
        ),
      ),
      body: itemList.length==0
          ?Center(
        child: Container(
          child: CircularProgressIndicator(
            backgroundColor: Colors.orange,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
          ),// Text("  Please wait... Its taking longer than usual. Check your internet connection..")
        ),
      )

          : ViewPdf(),
    );
  }


  @override
  void initState() {

    super.initState();
    mainReference.once().then((DataSnapshot snap){
      print(snap);
      var data=snap.value;
      itemList.clear();
      // ignore: unnecessary_statements
      data.forEach((key, value){
        Modal m = new Modal(value['PDF'], value['Filename']);
        itemList.add(m);
        //get data from firebase
      });
      setState(() {

      });});
  }
}


class ViewPdf extends StatefulWidget {
  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  PDFDocument doc;
  @override
  Widget build(BuildContext context) {
    //get data from first class
    String data=ModalRoute.of(context).settings.arguments;
    ViewNow() async {
      doc = await PDFDocument.fromURL(
          data);
      setState(() {

      });
    }

    Widget Loading(){
      ViewNow();
      if(doc==null){
        return Center(
          child: Container(
            child: CircularProgressIndicator(
              backgroundColor: Colors.orange,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
            ),// Text("  Please wait... Its taking longer than usual. Check your internet connection..")
          ),
        );
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Time Table"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepOrangeAccent, Colors.orangeAccent]
              )
          ),
        ),
      ),

      body: doc==null?Loading():PDFViewer(document: doc),
    );
  }
}