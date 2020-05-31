import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_calendar/calendar.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          AnimatedContainer(
            height: MediaQuery.of(context).size.height - 200,
            duration: Duration(seconds: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(75.0),
                topRight: Radius.circular(
                  75.0,
                ),
              ),
              color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.5),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    0,
                    0,
                  ),
                ),
              ],
            ),
//            child: SfCalendar(
//              view: CalendarView.month,backgroundColor: Colors.green,
//                monthViewSettings: MonthViewSettings(showAgenda: true)
//            ),

//child: SizedBox(),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
