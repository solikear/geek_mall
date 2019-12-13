import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:geek_mall/common/api.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
    Dio _dio;
    factory HttpUtil() => _instance;
  
    HttpUtil._internal() {
      if(_dio == null){
        var options = BaseOptions(
          baseUrl: API.BASE_URL,
          receiveTimeout: 10000,
          connectTimeout: 5000,
          responseType: ResponseType.json
        );
        _dio = Dio(options);
      }
    }
    Future<Map<String,dynamic>> get(String path,[Map<String,dynamic> params]) async{
      Response<Map<String,dynamic>> response;
      if(params != null){
        response = await _dio.get(path,queryParameters: params);
      }else{
        response = await _dio.get(path);
      }
      if(response.statusCode ==200){
        return response.data;
      }else{
        LogUtil.e("请求出错");
        return response.data;
      }
    }
  
}
