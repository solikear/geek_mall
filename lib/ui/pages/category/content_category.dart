import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentCategory extends StatefulWidget {
  @override
  _ContentCategoryState createState() => _ContentCategoryState();
}

class _ContentCategoryState extends State<ContentCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
            height: ScreenUtil.instance.setHeight(200.0),
            child: Image.network(
                "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3246630332,3044294395&fm=26&gp=0.jpg",
                fit: BoxFit.fill),
          ),
          Padding(
            padding: EdgeInsets.only(top: 4.0),
          ),
          Center(
            child: Text(
              "居家",
              style: TextStyle(fontSize: 14.0, color: Colors.black54),
            ),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 6,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20.0,
                childAspectRatio: 0.85,
                crossAxisSpacing: 20.0),
            itemBuilder: (c, i) {
              return getItemView();
            },
          )
        ],
      ),
    );
  }

  Widget getItemView() {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        child: Card(
          child: Column(
            children: <Widget>[
              Image.network(
               "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1575880280650&di=5b351255fb93b20970e68ab8701e3f8c&imgtype=0&src=http%3A%2F%2Fcbu01.alicdn.com%2Fimg%2Fibank%2F2015%2F424%2F437%2F2504734424_495864414.jpg",
               fit: BoxFit.fill,
               height: 60, 
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
              ),
              Text(
                "沙发"
              )
            ],
          ),
        ),
      ),
    );
  }
}
