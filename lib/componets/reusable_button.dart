import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
class reuseable_button extends StatelessWidget {
  reuseable_button( {required this.onTap,required this.text});
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        )),
        color: kBottomContainer,
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 10.0),
      ),
    );
  }
}