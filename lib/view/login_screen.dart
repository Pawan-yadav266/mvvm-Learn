import 'package:flutter/material.dart';
import 'package:mvvm_learn/utils/routes/routes_name.dart';
import 'package:mvvm_learn/viewModel/auth_view_model.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(false);

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    passwordFocus.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();
    passwordFocus.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final auththViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocus,
              onFieldSubmitted: (valu){
                Utils.fieldFocusChange(context, emailFocus, passwordFocus);
              },
              decoration: const InputDecoration(
                  labelText: 'Email', prefixIcon: Icon(Icons.email)),
            ),
            const SizedBox(
              height: 18,
            ),
            ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (BuildContext context, value, Widget? child) {
                return TextFormField(
                  controller: _passwordController,
                  focusNode: passwordFocus,
                  obscureText: _obsecurePassword.value,
                  decoration: const InputDecoration(
                      labelText: 'password',
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      suffixIcon: Icon(Icons.visibility_off)),
                );
              },
            ),
            const SizedBox(
              height: 25,
            ),
            RoundButton(onPress: () {
              if(_emailController.text.isEmpty)
                {
                  Utils.toastMessage('please enter email');
                }
              else if(_passwordController.text.isEmpty){
                Utils.toastMessage('please enter password');
              }
              else
                {
                  Map data = {
                    "email": _emailController.text.toString(),
                    "password": _passwordController.text.toString()
                  };
                  auththViewModel.loginApi(data,context);
                  print('api hit');
                }

            }, text: 'Login',),
            const SizedBox(
              height: 15,
            ),
            InkWell(onTap: (){
              Navigator.pushNamed(context, RoutesName.signUp);
            },
                child: Text("don't have an account? SignUp"))
          ],
        ),
      ),
    );
  }
}
