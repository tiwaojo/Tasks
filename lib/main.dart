import 'dart:math';

import 'package:device_calendar/device_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/date_symbol_data_local.dart'; // to show date and time in different languages
import 'package:tasks/addEventsPage.dart';

import 'body.dart';
import 'bottom_sheet.dart';
import 'globals.dart' as globals;

//import 'package:device_calendar/device_calendar.dart';
//import 'addEventsPage.dart';

//import 'package:table_calendar/table_calendar.dart';
//import 'package:table_calendar/table_calendar.dart';
//import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
// import 'package:english_words/english_words.dart';
// import 'dart:html';

void main() {
  //=> runApp(MyApp());//one line functions or methods
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    Color c1 = const Color.fromRGBO(24, 34, 49, 100);
    return MaterialApp(
//      routes: {
//        AppRoutes.calendars: (context) {
//          return CalendarsPage(key: Key('calendarsPage'));
//        }
//      },
      title: 'Task',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(24, 34, 49, 100),
//        backgroundColor: ,

        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: "Phenomena",
            fontSize: 18,
            fontStyle: FontStyle.normal,
            color: Color.fromRGBO(255, 51, 102, 100),
          ),
          headline2: TextStyle(
            fontFamily: "Phenomena",
            fontSize: 24,
            fontStyle: FontStyle.normal,
            color: Color.fromRGBO(255, 51, 102, 100),
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //Unknown
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  DeviceCalendarPlugin _deviceCalendarPlugin;

//  List<Calendar> _calendars;
//  Calendar _selectedCalendar;
//
//  CalendarPageState() {
//    _deviceCalendarPlugin = new DeviceCalendarPlugin();
//  }
//
//  void _retrieveCalendars() async {
//    //Retrieve user's calendars from mobile device
//    //Request permissions first if they haven't been granted
//    try {
//      var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
//      if (permissionsGranted.isSuccess && !permissionsGranted.data) {
//        permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
//        if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
//          return;
//        }
//      }
//
//      final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
//      setState(() {
//        _calendars = calendarsResult?.data;
//      });
//    } catch (e) {
//      print(e);
//    }
//  }

//  static DateTime _tenthDay;

//  List<DateTime> _markedDate = [DateTime(2020, 5, 20), DateTime(2020, 5, 15)];

//  LinkedList<> _myEvents; // _calendarController;

//  Animation<double> widthAnimation;

  final _pageController = PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    _retrieveCalendars();

    globals.animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    globals.animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: Duration(seconds: 2),
      value: 1,
      lowerBound: 0.4,
      upperBound: 1,
    );
    globals.animation = CurvedAnimation(
        parent: globals.animationController2, curve: Curves.easeOut);
    globals.animationController2.forward();
    globals.animationController1.repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
//    globals.animationController2.dispose();
//    globals.animationController1.dispose();
//    _pageController.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    Container _myMenu = Container(
      child: Center(
        child: Visibility(
          child: AnimatedOpacity(
//          key: ValueKey(2),
            opacity: globals.opacity,
            duration: Duration(seconds: 1),
            curve: Curves.easeIn,
            child:
              Column(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("data",style: TextStyle(fontFamily: "Phenomena",fontSize: 30),),
                  Text("data",style: TextStyle(fontFamily: "Phenomena",fontSize: 30),),
                  Text("data",style: TextStyle(fontFamily: "Phenomena",fontSize: 30),),
                  Text("data",style: TextStyle(fontFamily: "Phenomena",fontSize: 30),),
                  Text("data",style: TextStyle(fontFamily: "Phenomena",fontSize: 30),),
                ],
              ),
//          ListView(
//            padding: EdgeInsets.zero,
//            shrinkWrap: true,
//            children: <Widget>[
//              DrawerHeader(
//                child: Text(
//                  "Drawer header",
//                  style: TextStyle(color: Colors.amber),
//                ),
//              ),
//              ListTile(
////            contentPadding: EdgeInsetsGeometry.infinity,
//                leading: IconButton(
//                  icon: Icon(Icons.calendar_today),
//                  onPressed: () {},
//                ),
//                title:
//                    Text("Year", style: Theme.of(context).textTheme.headline1),
//              ),
//              ListTile(
////            contentPadding: EdgeInsetsGeometry.infinity,
//                leading: IconButton(
//                  icon: Icon(Icons.calendar_today),
//                  onPressed: () {},
//                ),
//                title:
//                    Text("Year", style: Theme.of(context).textTheme.headline1),
//              ),
//              ListTile(
////            contentPadding: EdgeInsetsGeometry.infinity,
//                leading: IconButton(
//                  icon: Icon(Icons.calendar_today),
//                  onPressed: () {},
//                ),
//                title:
//                    Text("Year", style: Theme.of(context).textTheme.headline1),
//              ),
////          UserAccountsDrawerHeader(accountName: Text(), accountEmail: null)
//            ],
//          ),
          ),
        ),
      ),
    );
    Container _appbar = Container(
//              foregroundDecoration: BoxDecoration(color: Colors.transparent),
      margin: EdgeInsets.only(top: 20),width: MediaQuery.of(context).size.width,
//      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Transform(
            transform: Matrix4.rotationX(pi),
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: pi / 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
//                              icon: Icon(MdiIcons.equalizerOutline),
                    icon: Icon(IconData(0xe800, fontFamily: "appicons")),
                    color: Colors.pink,
                    splashColor: Colors.blue,
                    hoverColor: Colors.green,
                    onPressed: () {
//                        Transform.scale(scale: 0.5, child: _myBody);

                      setState(() {
                        if (globals.resized == true) {
//                            _opacity = _animation.value;
//                          globals.visibility = false;
                          globals.opacity = 0;
                          globals.animationController2.animateBack(1.0,
                              duration: Duration(seconds: 2),
                              curve: Curves.easeOut);

                          globals.resized = false;
                          print("scale up");
                        } else if (globals.resized == false) {
//                                    _scaffoldKey.currentState.openDrawer();
                          globals.opacity = 1;
                          globals.animationController2.animateTo(0.0,
                              duration: Duration(seconds: 2),
                              curve: Curves.easeInOutQuad);

//                          globals.visibility = true;
                          globals.resized = true;
                          print("scale down");
                          globals.alignment = Alignment.centerRight;
                        }
                      });
                    }),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.pink,
            iconSize: 30,
            onPressed: () {
              if (globals.modalOpen == false) {
//                            modalOpen=true;
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return
                      SingleChildScrollView(child: ModalBottomSheet());
                  },
                  backgroundColor: Colors.blueGrey,
                  enableDrag: true,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0)),
                  ),
                  isScrollControlled: true,
                  useRootNavigator: true,
                  isDismissible: true,
                );
              }
            },
          ),
        ],
      ),
    );
    Container _myBody = Container(
      child: ScaleTransition(
        alignment: globals.alignment,
        scale: globals.scale,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
//SizedBox(height: 30,),
            Flexible(flex: 1, child: _appbar),
            Flexible(flex: 5, child: MyBody()),
          ],
        ),
      ),
    );
    TextStyle textStyle1 = Theme.of(context).textTheme.headline1;

    /// Example Calendar Carousel without header and custom prev & next button

//    DraggableScrollableSheet _newEvent = DraggableScrollableSheet(
//        initialChildSize: 0.05,
//        minChildSize: 0.05,
//        maxChildSize: 0.99,
//        expand: true,
////      expand: _expand,
//        builder: (context, scrollController) {

//          return Container(
////            color: Colors.blue[100],
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.only(
//                topLeft: Radius.circular(75.0),
//                topRight: Radius.circular(
//                  75.0,
//                ),
//              ),
//              color: Colors.blue[100],
//              boxShadow: [
//                BoxShadow(
//                  color: Colors.red.withOpacity(0.5),
//                  blurRadius: 10.0,
//                  spreadRadius: 1.0,
//                  offset: Offset(
//                    0,
//                    0,
//                  ),
//                ),
//              ],
//            ),
//
//            child: ListView.builder(
//              controller: scrollController,
//              itemCount: 12,
//              itemBuilder: (BuildContext context, int index) {
//                return ListTile(title: Text(monthNames[index]));
//              },
//            ),
//          );
//        });

//    _myDrawer = new Container(
//      width: 150,
////      color: Colors.blue,
//      child: Drawer(
//        elevation: 0,
//        child: Container(
//          color: Color.fromRGBO(24, 34, 49, 100),
//
////backgroundColor: ,
////backgroundColor: Colors.transparent,
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              ListView(
//                padding: EdgeInsets.zero,
//                shrinkWrap: true,
//                children: <Widget>[
//                  DrawerHeader(
//                    child: Text(
//                      "Drawer header",
//                      style: TextStyle(color: Colors.amber),
//                    ),
//                  ),
//                  ListTile(
////            contentPadding: EdgeInsetsGeometry.infinity,
//                    leading: IconButton(
//                      icon: Icon(Icons.calendar_today),
//                      onPressed: () {},
//                    ),
//                    title: Text("Year"),
//                  ),
//                  ListTile(
////            contentPadding: EdgeInsetsGeometry.infinity,
//                    leading: IconButton(
//                      icon: Icon(Icons.calendar_today),
//                      onPressed: () {},
//                    ),
//                    title: Text("Year"),
//                  ),
//                  ListTile(
////            contentPadding: EdgeInsetsGeometry.infinity,
//                    leading: IconButton(
//                      icon: Icon(Icons.calendar_today),
//                      onPressed: () {},
//                    ),
//                    title: Text("Year"),
//                  ),
////          UserAccountsDrawerHeader(accountName: Text(), accountEmail: null)
//                ],
//              ),
//            ],
//          ),
//        ),
//      ),
//    );

    final pageView = PageView(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      allowImplicitScrolling: true,
      pageSnapping: true,
      children: <Widget>[
//      MyHomePage(),
        _myBody, Menu(),
      ],
    );

//    Curve _curve = Curves.fastOutSlowIn;
//    DraggableScrollableSheet _newEvent= new DraggableScrollableSheet(
//        initialChildSize: 0.4,
//        minChildSize: 0.2,
//        maxChildSize: 0.6,expand: true,
//        builder: (context, scrollController){
//      return SingleChildScrollView(
//      controller:scrollController,
//        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
//      );
//    }
//    );

    return Scaffold(
      key: _scaffoldKey,
//resizeToAvoidBottomInset: false,
//      resizeToAvoidBottomPadding: true,
      body: Container(height:MediaQuery.of(context).size.height,
        child: ListView(
          scrollDirection: Axis.horizontal,
          addAutomaticKeepAlives: true,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _myMenu,
//                _myBody,

          GestureDetector(
            onHorizontalDragStart: (details) {
              setState(() {
                if (globals.resized == true) {
//                            _opacity = _animation.value;
                  globals.visibility = false;

                  globals.animationController2.animateBack(1.0,
                      duration: Duration(seconds: 2), curve: Curves.easeOut);
                  globals.opacity = 0;
                  globals.resized = false;
                  print("scale up");
                } else if (globals.resized == false) {
                  _scaffoldKey.currentState.openDrawer();

                  globals.animationController2.animateTo(0.0,
                      duration: Duration(seconds: 2),
                      curve: Curves.easeInOutQuad);
                  globals.opacity = 1;
                  globals.visibility = true;
                  globals.resized = true;
                  print("scale down");
                  globals.alignment = Alignment.centerRight;
                }
              });
            },
            behavior: HitTestBehavior.translucent,
            child: _myBody,
          ),
              ],
            ),
          ],
        ),
      ),

//      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
