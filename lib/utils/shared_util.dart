import 'dart:async';
import 'dart:core';

import 'package:geek_mall/common/string.dart';
import 'package:geek_mall/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreUtil {
  /**
   * 设置Token
   */
  static Future<bool> setToken(String token) async {
    bool result;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    result = await preferences.setString(Strings.Shared_Token, token);
    return result;
  }

  static Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString(Strings.Shared_Token);
    return token;
  }

  static Future<bool> deleteToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool result = await preferences.setString(Strings.Shared_Token, null);
    return result;
  }

  static Future setUser(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(Strings.Shared_Image, user.image);
    preferences.setString(Strings.Shared_Email, user.email);
    preferences.setString(Strings.Shared_Mobile, user.mobile);
    preferences.setString(Strings.Shared_Name, user.username);
    preferences.setString(Strings.Shared_Realusername, user.realusername);
  }

  static Future<User> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String image = preferences.get(Strings.Shared_Image);
    String email = preferences.get(Strings.Shared_Email);
    String name = preferences.get(Strings.Shared_Name);
    String mobile = preferences.get(Strings.Shared_Mobile);
    String realname = preferences.get(Strings.Shared_Realusername);
    User user = User(
        mobile: mobile,
        email: email,
        image: image,
        username: name,
        realusername: realname);
    return user;
  }

  static deleteUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(Strings.Shared_Image, null);
    preferences.setString(Strings.Shared_Email, null);
    preferences.setString(Strings.Shared_Name, null);
    preferences.setString(Strings.Shared_Mobile, null);
    preferences.setString(Strings.Shared_Realusername, null);
  }

  static Future<String> getResToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String resToken = preferences.getString(Strings.Shared_ResToken);
    return resToken;
  }

  static Future<bool> setResToken(String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool result = await preferences.setString(Strings.Shared_ResToken, token);
    return result;
  }

  static Future<bool> deleteResToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool result = await preferences.setString(Strings.Shared_ResToken, null);
    return result;
  }
}
