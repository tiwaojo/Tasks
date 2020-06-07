//import 'dart:html';

//import 'dart:js';

//import 'package:animate_do/animate_do.dart';
import 'package:css_colors/css_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'globals.dart';
import 'globals.dart' as globals;

class MyBody extends StatefulWidget {
//  MyBody({Key key}):super(key:key);

  @override
  _MyBodyState createState() => _MyBodyState();
}

CalendarCarousel _calendarCarousel;

class CurrentEvent {
  CurrentEvent({this.isExpanded: false, this.header, this.body});

  bool isExpanded;
  String header;
  String body;
}

class _MyBodyState extends State<MyBody> with TickerProviderStateMixin {
  List<CurrentEvent> _currentDayEvent = <CurrentEvent>[
    CurrentEvent(header: "_markedDateMap.events.toString()", body: "df"),
    CurrentEvent(header: "_markedDateMap.events.toString()2", body: "df"),
    CurrentEvent(header: "_markedDateMap.events.toString()3", body: "df"),
  ];

//  static List<String> monthNames = const <String>[
//    'Jan',
//    'Feb',
//    'Mar',
//    'Apr',
//    'May',
//    'Jun',
//    'Jul',
//    'Aug',
//    'Sep',
//    'Oct',
//    'Nov',
//    'Dec',
//  ];
  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  static Widget _eventIcon = new Container(
//    height: 10,width: 10,
//    child:Center(
//    decoration: new BoxDecoration(
//        color: Colors.amberAccent,
//        borderRadius: BorderRadius.all(Radius.circular(1000)),
//        border: Border.all(color: Colors.blue, width: 0.05)),
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: new Icon(
        Icons.trip_origin,
        size: 10,
        color: Colors.amber,
      ),
    ),
  );

  @override
  void initState() {
    super.initState();

    /// Add more events to _markedDateMap EventList
    _markedDateMap.add(
        new DateTime(2020, 5, 25),
        new Event(
          date: new DateTime(2020, 5, 25, 9, 30),
          title: DateTime(2020, 5, 25, 9, 30).toString(),
          icon: _eventIcon,
        ));
    _markedDateMap.addAll(new DateTime(2020, 5, 26), [
      new Event(
        date: new DateTime(2020, 5, 26),
        title: 'Event 6',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 5, 26),
        title: 'Event 6',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2020, 5, 26),
        title: 'Event 6',
        icon: _eventIcon,
      ),
    ]);

    _markedDateMap.add(
        new DateTime(2020, 5, 17),
        new Event(
          date: new DateTime(2020, 5, 17),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(
      new DateTime(2020, 5, 11),
      [
        new Event(
          date: new DateTime(2020, 5, 11),
          title: 'Event 1',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2020, 5, 11),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2020, 5, 11),
          title: 'Event 3',
          icon: _eventIcon,
        ),
        //get the day and set its icons to null
      ],
    );

    _markedDateMap.addAll(
      new DateTime(2020, 5, 10),
      [
        new Event(
          date: new DateTime(2020, 5, 10),
          title: '2020, 510',
          icon: _eventIcon,
//          dot: Container(
//            margin: EdgeInsets.symmetric(horizontal: 1.0),
//            color: Colors.red,
//            height: 5.0,
//            width: 5.0,
//          ),
        ),
        new Event(
          date: new DateTime(2020, 5, 10),
          title: '2020, 5 10',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2020, 5, 10),
          title: '2020, 50',
          icon: _eventIcon,
        ),
      ],
    );
//    globals.opacity=0;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
//    globals.animationController2.dispose();
//    globals.animationController1.dispose();globals.opacity=0;
//    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _calendarCarousel = CalendarCarousel<Event>(
//      todayBorderColor: null,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => globals.selectedDate = date);
        events.forEach((event) {
          print(event.title);
//          event.dot;
        });
      },
      markedDateMoreCustomDecoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(75.0),
          topRight: Radius.circular(
            75.0,
          ),
        ),
        color: Colors.blue[100],
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
      pageSnapping: true,
//      scrollDirection: Axis.vertical,
      daysHaveCircularBorder: null,
//      calendarStyle: CalendarStyle(),
//      scrollDirection: Axis.horizontal,
      isScrollable: true,
      showOnlyCurrentMonthDate: true,
      height: 300,
//      width: MediaQuery.of(context).size.width,
      weekendTextStyle: TextStyle(
        color: CSSColors.grey,
        fontFamily: "Phenomena",
      ),
      thisMonthDayBorderColor: Colors.transparent,

      weekFormat: false,
      weekdayTextStyle: TextStyle(
        fontFamily: "Phenomena",
        fontSize: 16,
      ),

      weekDayFormat: WeekdayFormat.standaloneNarrow,

      selectedDateTime: globals.selectedDate,
      targetDateTime: globals.targetDateTime,
      daysTextStyle: TextStyle(
        color: Colors.pinkAccent,
        fontFamily: "Phenomena",
        fontSize: 14,
      ),
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.yellow,
        fontSize: 16,
        fontFamily: "Phenomena",
        fontStyle: FontStyle.normal,
      ),
      todayButtonColor: Colors.pink,

      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateWidget: _eventIcon,
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      markedDatesMap: _markedDateMap,
//      markedDateCustomTextStyle: TextStyle(
//        fontSize: 16,
//        color: Colors.deepOrange,
//      ),
//      markedDateCustomShapeBorder:
//    CircleBorder(side: BorderSide(color: Colors.yellow),
//
//    ),
      markedDateMoreShowTotal: null,
      // null for not showing hidden events indicator
      markedDateIconMargin: 16,
//      markedDateIconOffset:  -10,

      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
        fontSize: 18,
        fontFamily: "Phenomena",
      ),
      //      Container(
//          margin: EdgeInsets.all(5),
//          alignment: Alignment.center,
//          decoration: BoxDecoration(
//              color: Color.fromRGBO(24, 34, 49, 100),
//              borderRadius: BorderRadius.circular(20.0),
//              boxShadow: [
//                  BoxShadow(
//                    color: Color.fromRGBO(0, 0, 0, 100),
//                    blurRadius: 20.0,
//                    spreadRadius: 5.0,
//                    offset: Offset(
//                      0,
//                      2,
//                    ),
//                  )
//              ])),
//       markedDateIconBuilder: (event) {
//         return event.icon;
//       },
      // markedDateMoreShowTotal:
      //     true,

      selectedDayButtonColor: Colors.grey,
      minSelectedDate: globals.currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: globals.currentDate.add(Duration(days: 360)),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          globals.targetDateTime = date;
          globals.currentMonth =
              DateFormat.MMMM().format(globals.targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
        //Long press to add an event
      },
//      calendarController: null,
    );

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
//SizedBox(height: 30,),

        Card(
          margin: EdgeInsets.all(20),
          elevation: 10,
          borderOnForeground: false,
          shadowColor: Colors.blue,
          semanticContainer: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              cardColor: Color.fromRGBO(24, 34, 49, 100),
              dividerColor: Colors.transparent,
              dividerTheme: DividerThemeData(thickness: 23, space: 20),

              cardTheme: CardTheme(
//                    margin: EdgeInsets.all(6),
                elevation: 3,
                shadowColor: Colors.amber,
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(15)),
              ),

//              textTheme: ,
            ),
            isMaterialAppTheme: true,
            child: ExpansionPanelList(
              animationDuration: Duration(seconds: 1),
              expansionCallback: (int index, bool isExpanded) {
                setState(
                  () {
                    _currentDayEvent[index].isExpanded =
                        !_currentDayEvent[index].isExpanded;
                  },
                );
              },
              children: _currentDayEvent.map<ExpansionPanel>(
                (CurrentEvent currentEvent) {
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
//                          ClipRRect(
//                            borderRadius: BorderRadius.circular(20),
                        child: Text("data"),
//                          ListTile(isThreeLine: false,
//                            contentPadding: EdgeInsets.all(3.0),
//                            leading: Container(
//                              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
////                                decoration: BoxDecoration(
////                                    border: Border(
////                                        left: BorderSide(
////                                            width: 3.0, color: Colors.white54))),
//                              child: Icon(
//                                Icons.account_circle,
//                                size: 30.0,
//                                color: Colors.black,
//                              ),
//                            ),
//                            title: ListTile(
//                              contentPadding: EdgeInsets.all(0.0),
//                              title: Text(
//                                currentEvent.header,
//                                style: TextStyle(
//                                  color: Colors.black,
//                                  fontSize: 14.0,
//                                ),
//                              ),
//                            ),
//                          ),
                      );
//                          return Container(
////                            color:Colors.blue,
//                            alignment: Alignment.center,
//                            //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue),
//                            child: Text(
//                              currentEvent.header,
//                              style: textStyle1,
//                            ),
//                          );
                    },
                    isExpanded: currentEvent.isExpanded,
                    canTapOnHeader: true,
                    body: Container(
                      color: Colors.blue,
                      child: Text(
                        currentEvent.body,
                        style: Theme.of(context).textTheme.headline2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  );
                },
              ).toList(),
              expandedHeaderPadding: EdgeInsets.all(0.0),
            ),
          ),
        ),

        Column(
          children: <Widget>[
            TableCalendar(
              calendarController: globals.calendarController,
              initialCalendarFormat: CalendarFormat.month,
              events: events,
              formatAnimation: FormatAnimation.scale,
              availableGestures: AvailableGestures.verticalSwipe,
              calendarStyle: CalendarStyle(
                todayColor: Colors.pink,
                highlightSelected: true,
                canEventMarkersOverflow: true,
                markersPositionBottom: 1,
                markersAlignment: Alignment.bottomCenter,
                markersColor: Colors.black,
                markersMaxAmount: 1,
                markersPositionLeft: 22,
//markersPositionRight: 4,
//                markersPositionTop:40,
//                            contentPadding: EdgeInsets.all(12)
//                          markersPositionBottom: 10,
              ),
              builders:
                  CalendarBuilders(todayDayBuilder: (context, date, events) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.all(6),
                      margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(30),
                        shape: BoxShape.circle,
                        color: Theme.of(context).backgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.5),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                            offset: Offset(
                              0,
                              0,
                            ),
                          ),
                        ],
                      ),
                      child: Text(
                        date.day.toString(),
                      ),
                    ),
//                          Container(
////                                    color: Colors.black,
//                            alignment: Alignment.center,
//                            height:6,
//                            width: 6,
////                                  margin: EdgeInsets.all(6),
//                            decoration: BoxDecoration(color:Colors.black ,shape: BoxShape.circle),)
                  ],
                );
              }, selectedDayBuilder: (context, date, events) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(30),
                    shape: BoxShape.circle,
                    color: Theme.of(context).backgroundColor,

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.5),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          0,
                          0,
                        ),
                      ),
                    ],
                  ),
                  child: Text(
                    date.day.toString(),
                  ),
                );
              }),
            ),
          ],
        ),

//              Container(
//                child: Center(
//                  child: AnimatedIcon(
//                    icon: AnimatedIcons.add_event,
//                    progress: globals.animationController1,
//                    color: Colors.pinkAccent,
//                  ),
//                ),
//              ),
//        Container(
//          margin: EdgeInsets.symmetric(horizontal: 50.0),
//          child: Column(
//            children: <Widget>[
//              Container(
//                alignment: Alignment.bottomCenter,
//
////                  height: 100,
////                  color: Colors.black,
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                      mainAxisSize: MainAxisSize.max,
//                  children: <Widget>[
//                    Hero(tag:"currentMonth",transitionOnUserGestures: true,
//                      child: GestureDetector(onTap: () {
//                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Menu()));
//                      },
//                        child: Padding(
//                          padding: const EdgeInsets.only(left:10.0),
//                          child: Text(
//                            globals.currentMonth,
//                            style: TextStyle(
//                                fontFamily: "Phenomena",
//                                fontWeight: FontWeight.bold,
//                                fontSize: 24.0,
//                                color: CSSColors.deepPink),
//                          ),
//                        ),
//                      ),
//                    ),
//                    Row(
//                      children: <Widget>[
//                        IconButton(
//                          icon: Icon(Icons.chevron_left, size: 20),
//                          tooltip: globals.prevMonth,
//                          color: Colors.pink,
//                          iconSize: 15,
//                          onPressed: () {
//                            setState(() {
//                              globals.targetDateTime = DateTime(
//                                  globals.targetDateTime.year,
//                                  globals.targetDateTime.month - 1);
//                              globals.currentMonth =
//                                  DateFormat.yMMM().format(globals.targetDateTime);
//                              print(globals.currentMonth =
//                                  DateFormat.MMMM().format(globals.targetDateTime));
//                            });
//                          },
//                        ),
//                        IconButton(
//                          icon: Icon(
//                            Icons.chevron_right,
//                            size: 20,
//                          ),
//                          tooltip: globals.nextMonth,
//                          color: Colors.pink,
//                          iconSize: 15,
//                          onPressed: () {
//                            setState(() {
//                              globals.targetDateTime = DateTime(
//                                  globals.targetDateTime.year,
//                                  globals.targetDateTime.month + 1);
//                              globals.currentMonth =
//                                  DateFormat.yMMM().format(globals.targetDateTime);
//                              print(globals.currentMonth =
//                                  DateFormat.MMMM().format(globals.targetDateTime));
//                            });
//                          },
//                        ),
//                      ],
//                    )
//                  ],
//                ),
//              ),
//              //Calendar
//              Container(
////                    margin: EdgeInsets.fromLTRB(40.0, 2.0, 40.0, 10.0),
////                    padding: EdgeInsets.symmetric(horizontal: 5.0),
//                child: _calendarCarousel,
//              ),
//            ],
//          ),
//        ),
        //icons for the previous and next button

//            Container(
////              alignment: Alignment.center,margin: EdgeInsets.symmetric(horizontal: 80),
////            child:FractionallySizedBox(alignment: Alignment.center,
////              widthFactor: 0.9,
//            height: 44,constraints: BoxConstraints.expand(height:80.0),
//
//              child: _newEvent,
////            ),
//            ),
      ],
    );
  }
}
