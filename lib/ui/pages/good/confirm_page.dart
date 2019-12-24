import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geek_mall/common/colors.dart';
import 'package:geek_mall/common/custom_icon.dart';

class ConfirmPage extends StatefulWidget {
  @override
  _ConfirmPageState createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  String address =
      """Name Chinese Civic Center, Bao Shan Jing Library jlkasjdklasdjsklad""";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: AppColors.grey,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.grey,
            size: 30.0,
          ),
          onPressed: () {},
        ),
        title: Text(
          "确认订单",
          style: TextStyle(color: Colors.grey[600]),
        ),
        elevation: 0.0,
      ),
      body: Container(
        width: ScreenUtil.getInstance().width,
        height: ScreenUtil.getInstance().height,
        color: AppColors.grey,
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: addressCard()),
            Padding(
              padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(400),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10.0, top: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // Baseline(
                            //   baseline: 30.0,
                            //   baselineType: TextBaseline.alphabetic,
                            //   child: Icon(CustomIcon.shop),
                            // ),
                            // Baseline(
                            //     baseline: 30.0,
                            //     baselineType: TextBaseline.alphabetic,
                            //     child: Text("小米水星店铺")),
                            Icon(
                              CustomIcon.shop,
                              size: ScreenUtil().setWidth(55),
                              ),
                            SizedBox(
                              width: 3.0,
                            ),
                            Text(
                              "水星记周边专卖店",
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(32)
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget addressCard() {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        height: ScreenUtil().setHeight(300),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(30),
                right: ScreenUtil().setWidth(5),
              ),
              child: Container(
                width: ScreenUtil().setWidth(130),
                alignment: Alignment.center,
                child: Icon(
                  CustomIcon.location,
                  color: Colors.deepOrangeAccent,
                  size: 35.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(20),
                // top: ScreenUtil().setHeight(30)
              ),
              child: Container(
                width: ScreenUtil().setWidth(650),
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "宋伟杰",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(48),
                      ),
                    ),
                    Text(
                      address,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
