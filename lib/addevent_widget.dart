import 'package:flutter/material.dart';

class AddEventWidget extends StatefulWidget {
  @override
  _AddEventWidgetState createState() => _AddEventWidgetState();
}

class _AddEventWidgetState extends State<AddEventWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      margin: EdgeInsets.only(top: 5, left: 15, right: 15),
//      height: 160,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 125,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black,
                  spreadRadius: 5,
                )
              ],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    decoration: InputDecoration.collapsed(hintText: "Title"),
                    style: TextStyle(
                        color: Colors.pinkAccent, fontFamily: "Phenomena"),),

                ),
                Scaffold(
//                  alignment: Alignment.bottomCenter,
                  body: MaterialButton(
                    color: Colors.pink,
                    child: Text("Add Event", style: TextStyle(
                        color: Colors.pinkAccent, fontFamily: "Phenomena"), ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
