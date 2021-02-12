import 'package:flutter/material.dart';
import 'package:sjce_myclassroom/utils/search.dart';


class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepOrange,
      hoverColor: Colors.deepOrangeAccent,
      child: Icon(Icons.search,),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=> Search()));
      },
    );
  }
}
