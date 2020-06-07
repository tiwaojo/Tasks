library tasks.globals;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

Animation<double> animation;
AnimationController animationController1, animationController2;
String currentMonth = DateFormat.MMMM().format(DateTime.now());
DateTime targetDateTime = DateTime(2020, 6, 8);
DateTime currentDate = DateTime(2020, 6, 7);
DateTime selectedDate = DateTime.now();

bool modalOpen = false;
bool resized = true;
//double infinHeight=double.infinity;
bool visibility = false;
double opacity = 0.0;
var scale = animationController2;
CalendarController calendarController;
Map<DateTime, List<dynamic>> events;
TextEditingController eventController;
String nextMonth = DateFormat.MMMM()
    .format(DateTime(targetDateTime.year, targetDateTime.month + 1));
String prevMonth = DateFormat.MMMM()
    .format(DateTime(targetDateTime.year, targetDateTime.month - 1));
var alignment = Alignment.center;
