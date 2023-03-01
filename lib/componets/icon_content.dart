import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class CardChild extends StatelessWidget {
  final IconData icon;
  final String text;
  CardChild(this.icon, this.text);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kIncactiveTextStyle,
        ),
      ],
    );
  }
}
