import 'package:flutter/material.dart';
import 'package:mvvm_add_user_project/constants/colors.dart';

class AppTitle extends StatelessWidget {
  final String? text;

  const AppTitle({this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text!,
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: CustomColors.primaryTextColor),
      ),
    );
  }
}
