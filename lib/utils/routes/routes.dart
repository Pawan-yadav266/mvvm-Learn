import 'package:flutter/material.dart';
import 'package:mvvm_learn/utils/routes/routes_name.dart';
import 'package:mvvm_learn/view/SignUp.dart';
import 'package:mvvm_learn/view/home_screen.dart';
import '../../view/login_screen.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SIgnUpScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Route Define'),
            ),
          );
        });
    }
  }
}
