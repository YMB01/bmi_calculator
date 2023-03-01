import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.icon, this.onpress);
  final IconData icon;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      elevation: 0.0,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}
