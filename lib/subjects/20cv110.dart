import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Modal{
  String link,name;
  Modal(this.link,this.name);
}

class Mechanics extends StatefulWidget {
  // final String title;
  // final String db_name;
  // Mechanics(this.title, this.db_name)

  @override
  _MechanicsState createState() => _MechanicsState();
}

class _MechanicsState extends State<Mechanics> {
  List<Modal> itemList=List();
  final mainReference = FirebaseDatabase.instance.reference().child("Mechanics");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechanics - 20CV110'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepOrangeAccent, Colors.orangeAccent]
              )
          ),
        ),
      ),
      body: itemList.length==0?Center(
        child: Container(
          child: CircularProgressIndicator(
            backgroundColor: Colors.orange,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
          ),// Text("  Please wait... Its taking longer than usual. Check your internet connection..")
        ),
      ) : ListView.builder(
        itemCount:itemList.length,
        itemBuilder: (context,index){
          return Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25 , 0),
              child: GestureDetector(
                onTap: (){
                  String passData=itemList[index].link;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>ViewPdf(),
                          settings: RouteSettings(
                            arguments: passData,
                          )
                      )
                  );
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/pdfbg.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 140,
                        child: Card(
                          margin: EdgeInsets.all(18),
                          elevation: 7.0,
                          child: Center(
                            child: Text(itemList[index].name.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),),
                            //child: Text(itemList[index].name.toString()),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getPdfAndUpload();
          },
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.red,
      ),
    );
  }
  Future getPdfAndUpload()async{
    var rng = new Random();
    String randomName="";
    for (var i = 0; i < 20; i++) {
      print(rng.nextInt(100));//generate
      randomName += rng.nextInt(100).toString();
    }
    File file = await FilePicker.getFile(type: FileType.custom);
    String fileName = '${randomName}.pdf';
    savePdf(file.readAsBytesSync(), fileName);
    //function call
  }
  savePdf(List<int> asset, String name) async {
    Reference reference = FirebaseStorage.instance.ref("onlinepdf/mechanics/").child(name);
    UploadTask uploadTask = reference.putData(asset);
    String url = await (await uploadTask).ref.getDownloadURL();
    documentFileUpload(url);
    //function call
  }
  String CreateCryptoRandomString([int length = 32]) {
    final Random _random = Random.secure();
    var values= List<int>.generate(length, (index) => _random.nextInt(256));
    return base64Url.encode(values);
    //generate key
  }
  void documentFileUpload(String str) {
    var data = {
      "PDF" : str,
      "Filename": "Mech Ebook",
      //store data
    };
    mainReference.child(CreateCryptoRandomString()).set(data).then((v) {
      print("Stored Successfully");
    });
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
        title: Text("PDF Reader"),
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