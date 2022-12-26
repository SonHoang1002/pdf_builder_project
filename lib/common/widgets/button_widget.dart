import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget {
  Widget buildButtonBottom({Function? action,required String title,  double top=0}) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top:top),
        child: ElevatedButton(
          child: Text(title,style:const  TextStyle(color: Colors.white,fontSize: 20),),
          onPressed: action!(),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              fixedSize: MaterialStateProperty.resolveWith(
                  (states) => const Size(250, 55)),
              side: MaterialStateProperty.resolveWith(
                  (states) => const BorderSide(color: Colors.transparent)),
              mouseCursor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  return MouseCursor.defer;
                }
                return MouseCursor.uncontrolled;
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                      side: const BorderSide(color: Colors.white)))),
        ),
      ),
    );
  }
}
