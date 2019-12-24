import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geek_mall/common/colors.dart';
import 'package:geek_mall/common/common_index.dart';
import 'package:geek_mall/models/good_detail.dart';
import 'package:geek_mall/service/good_service.dart';
import 'package:geek_mall/ui/pages/good/detail_swiper.dart';
import 'package:geek_mall/ui/pages/good/detail_webview.dart';
import 'package:geek_mall/ui/pages/good/good_select.dart';

class GoodsDetailPage extends StatefulWidget {
  final String goodId;

  const GoodsDetailPage({Key key, this.goodId}) : super(key: key);

  @override
  _GoodsDetailPageState createState() => _GoodsDetailPageState();
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  String _goodId;
  GoodDetail _goodDetail;
  Future _future;
  @override
  void initState() {
    super.initState();
    _goodId = widget.goodId;
    _future = getDetail();
  }

  Future getDetail() async {
    _goodDetail = await GoodService.getGoodDetail(_goodId);
    print(_goodDetail.banners);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.DETAIL),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _future,
        builder: (c, s) {
          switch (s.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: Text("Waitng"),
              );
            case ConnectionState.done:
              return _detailView();
          }
        },
      ),
    );
  }

  Widget _detailView() {
    List<Skus> _goodSkusList = _goodDetail.skus;
    List<String> _itemList = List<String>();
    double _minPrice = _goodSkusList[0].price;
    for (Skus sk in _goodSkusList) {
      if (sk.price < _minPrice) {
        _minPrice = sk.price;
      }
      for(Specs specs in sk.specs){
        print(specs.value);
      }
    }
    return Container(
      color: AppColors.grey,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          ListView(
            children: <Widget>[
              DetailSwiperView(
                bannerData: _goodDetail.banners,
                size: _goodDetail.banners.length,
                viewHeight: ScreenUtil().setHeight(700),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey,
              ),
              Container(
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                      ),
                      Text(
                        _goodDetail.title,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 6.0),
                      ),
                      // Row(
                      //   children: <Widget>[
                      //     Text(
                      //       "现价：${_minPrice}",
                      //       style: TextStyle(
                      //           color: Colors.deepOrangeAccent, fontSize: 14.0),
                      //     ),
                      //   ],
                      // ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6.0),
              ),
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text("请选择规格数量"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return GoodSelectPage(
                                goodDetail: _goodDetail,
                              );
                            });
                      },
                    )
                  ],
                ),
              ),
            //  WebViewPage(),
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Image.network("https://img.alicdn.com/imgextra/i4/1714128138/O1CN018f4DO629zFkE1qyVj_!!1714128138.jpg"),
                  
                ],
              ),
            )
            ],
          ),
          Positioned(
            child: Container(
              width: double.infinity,
              height: ScreenUtil().setHeight(150),
              color: Color(0XFFfffffd),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){},
                    icon: Icon(CustomIcon.shop,size: 30.0,),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(CustomIcon.seller,size: 30.0,),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(CustomIcon.favorite,size: 30.0,),
                  ),
                  Spacer(),
                  FlatButton(
                    color: AppColors.shopYellow,
                    onPressed: (){
                      showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return GoodSelectPage(
                                goodDetail: _goodDetail,
                              );
                            });
                    },
                    child: Text("加入购物车"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),topLeft: Radius.circular(20.0))
                    ),
                  ),
                  FlatButton(
                    color: Colors.deepOrangeAccent,
                    onPressed: (){
                      showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return GoodSelectPage(
                                goodDetail: _goodDetail,
                              );
                            });
                    },
                    child: Text("立刻购买"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0),topRight: Radius.circular(20.0))
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
