
import 'package:flutter/material.dart';
import 'package:mvvm_learn/viewModel/auth_view_model.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';
import 'package:provider/provider.dart';

class SIgnUpScreen extends StatefulWidget {
  const SIgnUpScreen({Key? key}) : super(key: key);

  @override
  State<SIgnUpScreen> createState() => _SIgnUpScreenState();
}

class _SIgnUpScreenState extends State<SIgnUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(false);

  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordFocus.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();
    _passwordFocus.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final auththViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('SIgnUp'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          focusNode: _emailFocus,
          onFieldSubmitted: (valu){
            Utils.fieldFocusChange(context, _emailFocus, _passwordFocus);
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
              focusNode: _passwordFocus,
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
            auththViewModel.signUpApi(data,context);
            print('api hit');
          }

        }, text: 'SignUp',),
        const SizedBox(
          height: 15,
        ),
        InkWell(child: Text("don't have an account? SignUp"))
        ],
      ),
    ),
    );
  }
}
