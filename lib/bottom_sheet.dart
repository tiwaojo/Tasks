import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalBottomSheet extends StatefulWidget {
  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return
       Container(
         margin: EdgeInsets.symmetric(horizontal: 10),
         height: MediaQuery.of(context).viewInsets.bottom+200.0,
         child: Column(mainAxisSize: MainAxisSize.min,
           children: <Widget>[
             TextFormField(
               autovalidate: true,
               autocorrect: true,
               autofocus: false,
//                      scrollPadding: EdgeInsets.all(10),
               cursorColor: Colors.pinkAccent,cursorRadius: Radius.circular(12),
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
             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 FlatButton(onPressed: (){Navigator.pop(context);}, child: Center(child: Text("Save")),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
                 FlatButton(onPressed: (){Navigator.pop(context);}, child: Center(child: Text("Cancel")),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
               ],
             )

           ],
         ),
       );
  }
}
