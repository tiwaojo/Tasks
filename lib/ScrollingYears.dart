import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrolling_years_calendar/year_view.dart';
import 'package:tasks/main.dart';

void main() => runApp(MyApp());

class ScrollingYears extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrolling Years Calendar',
      home: MyHomePage(),
      theme: ThemeData(
//        primaryColor: Colors.white,
//        primaryColorLight: Colors.blue,
//        primaryTextTheme: TextTheme(),
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
          headline1: TextStyle(color: Colors.pink),
          headline2: TextStyle(color: Colors.pink),
          headline3: TextStyle(color: Colors.pink),
          headline4: TextStyle(color: Colors.pink),
          button: TextStyle(color: Colors.pink),
          caption: TextStyle(color: Colors.pink),
        ).apply(
          bodyColor: Colors.orange,
          displayColor: Colors.green,
          fontFamily: "Phenomena",
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

DateTime initialDate = DateTime.now();
DateTime firstDate = DateTime.now();
DateTime lastDate = DateTime.now().add(Duration(days: 5 * 365));

class _MyHomePageState extends State<MyHomePage> {
//  List<DateTime> getHighlightedDates() {
//    return List<DateTime>.generate(
//      10,
//      (int index) => DateTime.now().subtract(Duration(days: 10 * (index - 1))),
//    );
//  }

  static List<String> monthNames = const <String>[
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  YearView _getYearView(int year) {
    return YearView(
      context: context,
      year: year,
      currentDateColor: Colors.green,
//      highlightedDates: widget.highlightedDates,
//      highlightedDateColor: widget.highlightedDateColor,
      monthNames: monthNames,
//      onMonthTap: widget.onMonthTap,
    );
  }
static bool _expand=false;
  DraggableScrollableSheet _newEvent = DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 0.99,
      expand: true,
//      expand: _expand,
      builder: (context, scrollController) {
//                        return SingleChildScrollView(
//                          controller:scrollController,
//                          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//                          style: TextStyle(color: Colors.pink),),
//                        );
        return Container(
          color: Colors.blue[100],
          child: ListView.builder(
            controller: scrollController,
            itemCount: 12,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text(monthNames[index]));
            },
          ),
        );
      });
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
//        Padding(
//          padding: const EdgeInsets.only(left: 30.0),
//          child:
              Transform(
                  transform: Matrix4.rotationX(pi),
                  alignment: Alignment.center,
//            angle: pi / 2,

                  child: Transform.rotate(
                    angle: pi / 2,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: IconButton(
                        icon: Icon(Icons.calendar_today),
//                        iconSize: 24,
                        color: Colors.pink,
                        onPressed: () {
                          Navigator.pop(context);
//                  DraggableScrollableSheet(
//                      initialChildSize: 0.5,
//                      minChildSize: 0.2,
//                      maxChildSize: 0.6,
////                      expand: true,
//                      builder: (context, scrollController){
////                        return SingleChildScrollView(
////                          controller:scrollController,
////                          child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
////                          style: TextStyle(color: Colors.pink),),
////                        );
//                        return Container(
//                          color: Colors.blue[100],
//                          child: ListView.builder(
//                            controller: scrollController,
//                            itemCount: 25,
//                            itemBuilder: (BuildContext context, int index) {
//                              return ListTile(title: Text('Item $index'));
//                            },
//                          ),
//                        );
//                      }
//                  );
//                    showBottomSheet(
//                      context: context, builder: (context){
//                        return Scaffold(extendBody: true,backgroundColor: Colors.amber,body: Container(height: 80,child: Text("sfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfgfg"
//                    ),
//                    ),
//                  );
//                  }
//                  );
                        },
                      ),
                    ),
                  )),

          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Transform.rotate(
                angle: pi / 2,
                child: IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 24,
                  color: Colors.pink,
                  onPressed: () {},
                ),
              ),
            )
          ],
          brightness: Brightness.dark,
          elevation: 0,
          backgroundColor: Colors.transparent,

          //.fromRGBO(24, 34, 49, 50),
        ),
        body: _newEvent);
  }
}

//    final int _itemCount = lastDate.year - firstDate.year +1 ;
//
//    // Makes sure the right initial offset is calculated so the listview
//    // jumps to the initial year.
//    final double _initialOffset =
//        (initialDate.year - firstDate.year) *
//            getYearViewHeight(context);
//    final ScrollController _scrollController =
//    ScrollController(initialScrollOffset: _initialOffset);
//
//    return Container(
//      color: Colors.blue,
//      child: ListView.builder(
//        padding: const EdgeInsets.only(bottom: 16.0),
//        controller: _scrollController,
//        itemCount: _itemCount,
//        itemBuilder: (BuildContext context, int index) {
//          final int year = index + firstDate.year;
//          return _getYearView(year);
//        },
//      ),
//    );

//    final newTextTheme = Theme.of(context).textTheme.apply(
//      bodyColor: Colors.pink,
//      displayColor: Colors.pink,
//      fontFamily: "Phenomena",
//    );
//    _scrollingYears = ScrollingYearsCalendar(
//      // Required properties
//
//      context: context,
//      initialDate: DateTime.now().add(Duration(days: -1),),
//      firstDate: DateTime(2020,5,11).subtract(const Duration(days: (5 * 365)-1),),
//      lastDate: DateTime.now(),
//      currentDateColor: Colors.blue,
//
//      // Optional properties
////      highlightedDates: getHighlightedDates(),
//      highlightedDateColor: Colors.deepOrange,
//      monthNames: const <String>[
//        'Jan',
//        'Feb',
//        'Mar',
//        'Apr',
//        'May',
//        'Jun',
//        'Jul',
//        'Aug',
//        'Sep',
//        'Oct',
//        'Nov',
//        'Dec',
//      ],
//      onMonthTap: (int year, int month) => print('Tapped $month/$year'),
//    );
//    return
//      Scaffold(
//        appBar: AppBar(
//        leading: Padding(
//          padding: const EdgeInsets.only(left: 30.0),
//          child: IconButton(
//              icon: Icon(Icons.calendar_today),
//              color: Colors.pink,
//              onPressed: () {
//                Navigator.pop(
//                  context,
////                  MaterialPageRoute(
////                    builder: (context) {
////                      return main();
////                    },
////                  ),
//                );
//              }),
//        ),
//        actions: <Widget>[
//          Padding(
//            padding: const EdgeInsets.only(right: 30.0),
//            child: IconButton(
//                icon: Icon(Icons.add), color: Colors.pink, onPressed: () {}),
//          )
//        ],
//        brightness: Brightness.dark,
//        elevation: 0,
//        backgroundColor: Colors.transparent,
//      ),
//        body: Container(
//          child: Theme(data: ThemeData(textTheme: newTextTheme),
//          child: Container(child: _scrollingYears,),)
//        ),
//      );
