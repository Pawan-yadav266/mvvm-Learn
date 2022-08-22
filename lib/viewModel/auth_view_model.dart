
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_learn/repository/auth_repository.dart';

class AuthViewModel with ChangeNotifier{


  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data,BuildContext context)async{

    _myRepo.loginApi(data).then((value) {
      if(kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if(kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data,BuildContext context)async{

    _myRepo.signUpApi(data).then((value) {
      if(kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if(kDebugMode) {
        print(error.toString());
      }
    });
  }




}