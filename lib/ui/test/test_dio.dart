import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geek_mall/service/good_service.dart';

class DioTestPage extends StatefulWidget {
  @override
  _DioTestPageState createState() => _DioTestPageState();
}

class _DioTestPageState extends State<DioTestPage> {
  String text;
  @override
  void initState() {
    // TODO: implement initState
    text = "无数据";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text("Dio"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: FlatButton(
                onPressed: () async {},
                child: Text("Go"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
