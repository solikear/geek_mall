import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:geek_mall/common/common_index.dart';
import 'package:geek_mall/widget/cached_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailSwiperView extends StatelessWidget {
  List<String> bannerData = new List();
  int size;
  double viewHeight;

  DetailSwiperView({Key key, this.bannerData,this.size,this.viewHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: viewHeight,
      child: bannerData == null || bannerData.length == 0
          ? Container(
              height: ScreenUtil.instance.setHeight(200.0),
              color: Colors.grey,
              alignment: Alignment.center,
              child: Text(Strings.NO_DATA_TEXT),
            )
          : Swiper(
              itemCount: bannerData.length,
              scrollDirection: Axis.horizontal,
              //滚动方向，设置为Axis.vertical如果需要垂直滚动
              loop: true,
              //无限轮播模式开关
              index: 0,
              //初始的时候下标位置
              autoplay: false,
              itemBuilder: (BuildContext buildContext, int index) {
                String imageUrl = API.BASE_URL+bannerData[index];
                print(imageUrl);
                return CachedImageView(
                    double.infinity, double.infinity,imageUrl);
              },
              duration: 10000,
              pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      size: 8.0,
                      color: Colors.white,
                      activeColor: Colors.deepOrangeAccent)),
            ),
    );
  }
}
