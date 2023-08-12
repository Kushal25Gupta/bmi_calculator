// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:bmi_calculator/Screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/reusable_card.dart';
import '../Components/icon_content.dart';
import '../constant.dart';
import '../Components/round_icon_button.dart';
import '../Components/bottom_button.dart';
import '../Components/bmi_calculator_brain.dart';

enum Gender { male, female, none }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Gender selected_gender = Gender.none;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundcolor,
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected_gender = Gender.male;
                        });
                      },
                      child: ReusableCard(
                          selected_gender == Gender.male
                              ? kActivecardcolor
                              : kInactiveCardColour,
                          const TopCardDetails(
                            'Male',
                            FontAwesomeIcons.mars,
                          ), () {
                        setState(() {
                          selected_gender = Gender.male;
                        });
                      }),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                        selected_gender == Gender.female
                            ? kActivecardcolor
                            : kInactiveCardColour,
                        const TopCardDetails(
                          'Female',
                          FontAwesomeIcons.venus,
                        ), () {
                      setState(() {
                        selected_gender = Gender.female;
                      });
                    }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                kInactiveCardColour,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kLabeltextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumbertextstyle,
                        ),
                        const Text(
                          'cm',
                          style: kLabeltextstyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFF8D8E98),
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                () {},
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ReusableCard(
                      kInactiveCardColour,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kLabeltextstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumbertextstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      () {},
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      kInactiveCardColour,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLabeltextstyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumbertextstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      () {},
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              'CALCULATE',
              () {
                BMI_Calculator bmicalculator = BMI_Calculator(height, weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmicalculator.bmi_calculation(),
                      bmicalculator.getResult(),
                      bmicalculator.getInterpretation(),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
