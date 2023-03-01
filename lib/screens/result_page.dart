import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import '../componets/reusable_card.dart';
import 'package:bmi_calculator/componets/reusable_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.getValue,
      required this.getResult,
      required this.getInterpretation});
  final String getValue;
  final String getResult;
  final String getInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              'Your Result',
              style: kYourResultStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    getResult,
                    style: kResultTextStyle,
                  ),
                  Text(
                    getValue,
                    style: kResultNumberStyle,
                  ),
                  Text(
                   getInterpretation,
                    textAlign: TextAlign.center,
                    style: kResultiDscriptionStyle,
                  ),
                ],
              ),
            ),
          ),
          reuseable_button(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
