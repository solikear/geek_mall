import "package:flutter/material.dart";

class ValueItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.all(5.0),
          // width: ScreenUtil().setWidth(50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(width: 0.5, color: Colors.black),
              color: Colors.lightBlue
              ),
          child: Text("Text"),
        );
  }
}