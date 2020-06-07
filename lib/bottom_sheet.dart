import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globals.dart' as globals;

class ModalBottomSheet extends StatefulWidget {
  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).viewInsets.bottom + 200.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: globals.eventController,
            autovalidate: true,
            autocorrect: true,
            autofocus: false,
//                      scrollPadding: EdgeInsets.all(10),
            cursorColor: Colors.pinkAccent,
            cursorRadius: Radius.circular(12),
            style: Theme.of(context).textTheme.headline1,
          ),
          TextFormField(
            autovalidate: true,
            autocorrect: true,
            autofocus: false,
//                      scrollPadding: EdgeInsets.all(10),
            cursorColor: Colors.pinkAccent,
            style: Theme.of(context).textTheme.headline1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: Center(child: Text("Save")),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  if (globals.eventController.text.isEmpty) return;
                  setState(() {
                    if (globals
                            .events[globals.calendarController.selectedDay] !=
                        null) {
                      globals.events[globals.calendarController.selectedDay]
                          .add(globals.eventController.text);
                      globals.calendarController.visibleEvents;
                      print("Event added");
                    } else {
                      globals.events[globals.calendarController.selectedDay] = [
                        globals.eventController.text
                      ];
                      print("Event not added");
                    }
                    globals.eventController.clear();
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Center(child: Text("Cancel")),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
