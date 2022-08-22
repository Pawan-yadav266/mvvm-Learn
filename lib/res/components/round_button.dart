import 'package:flutter/material.dart';
import 'package:mvvm_learn/data/response/api_response.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({Key? key,required this.text,this.loading=false,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 180,
        child: loading==false?Center(child: Text(text)):Center(child: CircleAvatar(),),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amberAccent
        )
      ),
    );
  }
}
