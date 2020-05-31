import 'dart:math';

import 'package:flutter/material.dart';
import 'globals.dart' as globals;


class Appbar extends StatefulWidget {
  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {


  @override
  void _resizeContext() {

       setState(() {
         if (globals.resized == true) {
//                            _opacity = _animation.value;
           globals.visibility = false;
           globals.opacity = 0;
           globals.animationController2.animateBack(
               1.0,
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

           globals.visibility = true;
           globals.resized = true;
           print("scale down");
           globals.alignment = Alignment.centerRight;
         }

     });}
  Widget build(BuildContext context) {
    return
      Container(
//              foregroundDecoration: BoxDecoration(color: Colors.transparent),
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(10),
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
                    icon: Icon(IconData(0xe800,fontFamily: "appicons")),
                    color: Colors.pink,
                    splashColor: Colors.blue,
                    hoverColor: Colors.green,
                    onPressed: () {
//                        Transform.scale(scale: 0.5, child: _myBody);
_resizeContext();

                    }),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.pink,iconSize: 30,
            onPressed: () {
//                        showModalBottomSheet((context) => _myBottomSheet);

//
//                          if (modalOpen == true) {modalOpen=false;
//                            Navigator.pop(context);
//
//                          }
              if (globals.modalOpen == false) {
//                            modalOpen=true;
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ModalBottomSheet();
                  },
                  backgroundColor: Colors.blue,
                  enableDrag: true,
                  isScrollControlled: true,
                  isDismissible: true,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
