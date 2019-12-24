import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geek_mall/common/api.dart';
import 'package:geek_mall/models/good_detail.dart';
import 'package:geek_mall/widget/cached_image.dart';

class GoodSelectPage extends StatefulWidget {
  // final List<Skus> skus;
  final GoodDetail goodDetail;

  const GoodSelectPage({Key key, this.goodDetail}) : super(key: key);
  @override
  _GoodSelectPageState createState() => _GoodSelectPageState();
}

class _GoodSelectPageState extends State<GoodSelectPage> {
  String currentitem;
  GoodDetail _goodDetail;
  String imageUrl;
  List<Skus> _skusList;
  List<String> _valueList = List<String>();
  String keyName;
  List<Widget> valueWidgetList = List<Widget>();
  @override
  void initState() {
    super.initState();
    init();
    generateItem();
  }

  void init() {
    _goodDetail = widget.goodDetail;
    imageUrl = API.BASE_URL + _goodDetail.image;
    _skusList = _goodDetail.skus;
    for (Skus skus in _skusList) {
      for (Specs specs in skus.specs) {
        _valueList..add(specs.value);
        keyName = specs.key;
      }
    }
    currentitem = _valueList[0];
  }

  void generateItem() {
    Color _color = Colors.white;
    Color _currentColor = Colors.lightBlue;
    Color itemColor = _color;
    valueWidgetList = List<Widget>.generate(_valueList.length, (i) {
      return GestureDetector(
        onTap: () {
          setState(() {
            currentitem = _valueList[i];
            refreshWidget(i);
          });
        },
        child: Container(
          padding: EdgeInsets.all(5.0),
          // width: ScreenUtil().setWidth(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(width: 0.5, color: Colors.black),
          ),
          child: Text(_valueList[i]),
        ),
      );
    });
  }

  void refreshWidget(int i) {
    Widget selectWidget = GestureDetector(
      onTap: () {
        setState(() {
          currentitem = _valueList[i];
        });
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        // width: ScreenUtil().setWidth(50),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(width: 0.5, color: Colors.black),
            color: Colors.lightBlue),
        child: Text(_valueList[i]),
      ),
    );
    Widget def = GestureDetector(
      onTap: () {
        setState(() {
          currentitem = _valueList[i];
        });
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        // width: ScreenUtil().setWidth(50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(width: 0.5, color: Colors.black),
        ),
        child: Text(_valueList[i]),
      ),
    );
    valueWidgetList[i] = selectWidget;
    for (int j = 0; j < valueWidgetList.length; j++) {
      if (j == i) {
        continue;
      }
      valueWidgetList[j] = def;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double wrem = width / 100;
    double hrem = height / 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 3 * hrem, left: 5 * wrem),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 25 * wrem,
                width: 25 * wrem,
                child:
                    CachedImageView(double.infinity, double.infinity, imageUrl),
              ),
              Padding(
                padding: EdgeInsets.only(left: 1 * wrem, top: 0 * hrem),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Spacer(),
                    Text(
                      "价格:￥99",
                      style: TextStyle(fontSize: 14.0, color: Colors.red),
                    ),
                    Text(
                      "库存: 8件",
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                    Text(
                      "已选: $currentitem",
                      style: TextStyle(fontSize: 13.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              // GestureDetector(
              //       onTap: () {
              //         setState(() {
              //           currentitem = "L";
              //         });
              //       },
              //       child: Container(
              //         // width: ScreenUtil().setWidth(50),
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //             border: Border.all(width: 0.5, color: Colors.black)),
              //         padding: EdgeInsets.symmetric(
              //             horizontal: 3 * wrem, vertical: 1 * hrem),
              //         child: Text("L"),
              //       ),
              //     ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 2 * hrem, left: 5 * wrem),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(keyName),
                SizedBox(
                  height: 10.0,
                ),
                Wrap(
                  spacing: 8.0, // 主轴(水平)方向间距
                  runSpacing: 4.0,
                  children: valueWidgetList,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Container(
              height: ScreenUtil().setHeight(130),
              color: Colors.white,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 0.5,
                    color: Colors.grey[300],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: <Color>[
                            Color(0XFFfd6f01),
                            Color(0xfffe4c02)
                          ]),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: ScreenUtil().setHeight(100),
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "确定",
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        )
      ],
    );
  }
}
