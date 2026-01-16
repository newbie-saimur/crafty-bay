import 'dart:convert';
import 'package:crafty_bay/features/common/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final String _userDataKey = "user-data";
  final String _userToken = "user-token";

  UserModel? userModel;
  String? userToken;

  Future<void> saveUserData(String token, UserModel model) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString(_userDataKey, jsonEncode(model.toJson()));
    await sharedPreferences.setString(_userToken, token);
    userModel = model;
    userToken = token;
  }

  Future<void> getUserData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? userData = sharedPreferences.getString(_userDataKey);
    String? userTokenData = sharedPreferences.getString(_userToken);
    if (userData != null) {
      userModel = jsonDecode(userData);
      userToken = userTokenData;
    }
  }

  Future<bool> isUserLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String? userToken = sharedPreferences.getString(_userToken);
    if (userToken != null) {
      return true;
    }
    clearUserData();
    return false;
  }

  Future<void> clearUserData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
