import 'package:flutter/material.dart';
import 'package:mvvm_learn/utils/routes/routes.dart';
import 'package:mvvm_learn/utils/routes/routes_name.dart';
import 'package:mvvm_learn/view/login_screen.dart';
import 'package:mvvm_learn/viewModel/User_View_model.dart';
import 'package:mvvm_learn/viewModel/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) { return AuthViewModel(); },),
        ChangeNotifierProvider(create: (BuildContext context) { return UserViewModel(); },)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
