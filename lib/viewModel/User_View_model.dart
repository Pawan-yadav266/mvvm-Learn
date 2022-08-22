
import 'package:flutter/cupertino.dart';
import 'package:mvvm_learn/modals/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{
  Future<bool> saveUser(UserModel user) async
  {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token',user.token.toString());
    return true;
  }

  Future<UserModel> getUser(UserModel user) async
  {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return UserModel(
      token: token.toString()
    );
  }

  Future<bool> remove()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }

}