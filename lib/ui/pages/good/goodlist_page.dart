import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geek_mall/common/common_index.dart';
import 'package:geek_mall/common/string.dart';
import 'package:geek_mall/models/product_list.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geek_mall/service/good_service.dart';
import 'package:geek_mall/ui/pages/good/good_detail_page.dart';

class GoodsPage extends StatefulWidget {
  @override
  _GoodsPageState createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage>
    with AutomaticKeepAliveClientMixin {
  List<Content> _goodList;
  Future _acquired;
  @override
  void initState() {
    _goodList = List<Content>();
    _acquired = _getGood();
    super.initState();
  }

  Future _getGood() async {
   _goodList =  await GoodService.getGoodsList();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.HOME),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        width: ScreenUtil.instance.width,
        height: ScreenUtil.instance.height,
        child: FutureBuilder(
          future: _acquired,
          builder: (c, s) {
            switch (s.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Container(
                    child: Center(
                      child: SpinKitWanderingCubes(
                        size: 40.0,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                );
              case ConnectionState.done:
                return ListView(
                  // shrinkWrap: true,
                  children: <Widget>[
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _goodList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.68),
                      itemBuilder: (c, i) {
                        return _itemCard(_goodList[i]);
                      },
                    )
                  ],
                );
            }
          },
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  void toDetail(String id){
    Navigator.of(context).push(MaterialPageRoute(
          builder: (c) => GoodsDetailPage(goodId: id,)
        ));
  }

  Widget _itemCard(Content goodContent) {
    String _goodImage = API.BASE_URL + goodContent.image;
    String _goodTitle = goodContent.title;
    List<Skus> _goodSkusList = goodContent.skus;
    double _minPrice = _goodSkusList[0].price;
    List<String> banners = goodContent.banners;
    for(Skus sk in _goodSkusList){
      if(sk.price < _minPrice){
        _minPrice = sk.price;
      }
    }
    String _goodId = goodContent.id;
    return GestureDetector(
      onTap: () => toDetail(_goodId),
      child: Card(
      color: Colors.white,
      elevation: 7.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(9.0)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        // height: ScreenUtil().setHeight(1000),
        // width: 195,
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(625),
              child: Image.network(
                _goodImage,
                fit: BoxFit.fill,),
            ),
            Container(
              // color: Colors.black,              
              height: ScreenUtil().setHeight(120),
              width: double.infinity,
              child: Text(_goodTitle,overflow: TextOverflow.ellipsis,softWrap:true,maxLines: 2,),
            ),
            Container(
                child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 70, left: 5),
                          child: Text(
                            '￥$_minPrice',
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                        ),
                        // Container(
                        //   padding: EdgeInsets.only(top: 3),
                        //   child: Text(
                        //     '￥225',
                        //     style: TextStyle(
                        //         decoration: TextDecoration.lineThrough,
                        //         color: Colors.grey[400],
                        //         fontWeight: FontWeight.w500),
                        //   ),
                        // )
                      ],
                    ))
              ],
            ))
          ],
        ),
      ),
    ),
    );
  }
}
