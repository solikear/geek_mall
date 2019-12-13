import 'package:common_utils/common_utils.dart';
import 'package:geek_mall/common/common_index.dart';
import 'package:geek_mall/models/good_detail.dart';
import 'package:geek_mall/models/product_list.dart';
import 'package:geek_mall/net/http_util.dart';
// import 'package:geek_mall/models/model_index.dart';

class GoodService {
  // 产品列表
  static Future<List<Content>> getGoodsList() async {
    LogUtil.e("================请求商品列表数据================");
    // Map<String, dynamic> response = await HttpUtil().get(API.GOODSLIST);

    Map<String, dynamic> response = await HttpUtil().get(API.GOODSLIST);
    List<Content> content = ProductList.fromJson(response).content;
    return content;
  }

  static Future<GoodDetail> getGoodDetail(String id) async {
    String goodId = API.GOOD + id;
    Map<String, dynamic> response = await HttpUtil().get(API.GOOD + id);
    GoodDetail goodDetail = GoodDetail.fromJson(response);
    return goodDetail;
  }
}
