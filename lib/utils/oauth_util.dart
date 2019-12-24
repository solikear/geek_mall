import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geek_mall/common/api.dart';
import 'package:geek_mall/models/user_model.dart';
import 'package:geek_mall/net/http_util.dart';
import 'package:geek_mall/user_model.dart';
import 'package:geek_mall/utils/shared_util.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
class Oauth2Util {
  static final authorizationEndpoint = Uri.parse(API.TokenUrl);
  static final identifier = "web";
  static final secret = "e25be7592b6a8a2c";
  static Future<String> oauthToLogin(String username, String password, BuildContext context)async{
    try{
      var client = await oauth2.resourceOwnerPasswordGrant(
        authorizationEndpoint, username, password,
        identifier: identifier,basicAuth: true,secret: secret);
      String result = await client.read(API.AuthServer);
      Map parsed = json.decode(result);
      print(result);
      SharedPreUtil.setUser(User.fromJson(parsed));
      SharedPreUtil.setToken(client.credentials.accessToken);
      SharedPreUtil.setResToken(client.credentials.refreshToken);
      return "success";
    }catch(e){
      return e.toString();
    }
  }
  static ResToken(BuildContext context){
    SharedPreUtil.getResToken().then((token)async{
       Map<String, dynamic> Params = {
        'grant_type': 'refresh_token',
        'refresh_token': '$token',
        'client_id': '$identifier',
        'client_secret': '$secret'
      };
      await HttpUtil().postdata(API.TokenUrl,params: Params).then((result){
        if(result ==400 || result ==401){
          print("asdasda");
        }else{
          SharedPreUtil.setToken(result['access_token']);
          SharedPreUtil.setResToken(result['refresh_token']);
        }
      });
    });
  }
}
