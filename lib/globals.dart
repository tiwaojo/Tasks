library tasks.globals;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Animation<double>  animation;
AnimationController  animationController1,  animationController2;
String  currentMonth = DateFormat.MMMM().format(DateTime.now());
DateTime  targetDateTime = DateTime(2020, 5, 8);
DateTime  currentDate = DateTime(2020, 5, 7);
DateTime  selectedDate = DateTime(2020, 5, 7);

bool modalOpen = false;
bool resized = false;
double minHeight = 1000;
double minWidth = 500;
bool visibility = true;
double opacity =0.0;
var scale = animationController2;


String  nextMonth = DateFormat.MMMM()
    .format(DateTime( targetDateTime.year,  targetDateTime.month + 1));
String  prevMonth = DateFormat.MMMM()
    .format(DateTime( targetDateTime.year,  targetDateTime.month - 1));
var alignment = Alignment.center;

