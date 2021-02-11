import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

// ignore: camel_case_types
class pdfview extends StatefulWidget {
  final String url;
  final String title;
  pdfview(this.url, this.title);
  @override
  _pdfviewState createState() => _pdfviewState();
}

class _pdfviewState extends State<pdfview> {
  //String pdfasset = "assets/syllabus/notes.pdf";
  PDFDocument _doc;
  bool _loading;


  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromURL(widget.url);
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrangeAccent, Colors.orangeAccent]
            )
          ),
        ),
        title: Text(widget.title),),
      body: _loading ? Center(child: CircularProgressIndicator(backgroundColor: Colors.orangeAccent,),) : PDFViewer(document: _doc,
        indicatorBackground: Colors.red,
        // showIndicator: false,
        // showPicker: false,
      ),
    );
  }
}

