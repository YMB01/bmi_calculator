import 'package:bmi_calculator/componets/icon_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/componets/icon_button.dart';
import 'package:bmi_calculator/constants.dart';
import '../componets/reusable_card.dart';
import 'result_page.dart';
import 'package:bmi_calculator/componets/reusable_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { Male, Female, Null }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectCardColor = Gender.Null;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: (() {
                      setState(() {
                        selectCardColor = Gender.Male;
                      });
                    }),
                    colour: selectCardColor == Gender.Male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: CardChild(
                      FontAwesomeIcons.mars,
                      'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectCardColor = Gender.Female;
                      });
                    },
                    colour: selectCardColor == Gender.Female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: CardChild(FontAwesomeIcons.venus, 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kTextstyle,
                      ),
                      Text(
                        'cm',
                        style: kIncactiveTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFBE1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8e98),
                      overlayColor: Color(0x29EBE1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      min: 120.0,
                      max: 220.0,
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kIncactiveTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kTextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              FontAwesomeIcons.plus,
                              (() {
                                setState(() {
                                  weight++;
                                });
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              FontAwesomeIcons.minus,
                              (() {
                                setState(() {
                                  weight--;
                                });
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kIncactiveTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kTextstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              FontAwesomeIcons.plus,
                              (() {
                                setState(() {
                                  age++;
                                });
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              FontAwesomeIcons.minus,
                              (() {
                                setState(() {
                                  age--;
                                });
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          reuseable_button(
              onTap: (() {
                CalculatorBrain calcu =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      getValue: calcu.calculateBMI(),
                      getInterpretation: calcu.getInterpretation(),
                      getResult: calcu.getResult(),
                    ),
                  ),
                );
              }),
              text: 'CALCULATE'),
        ],
      ),
    );
  }
}
