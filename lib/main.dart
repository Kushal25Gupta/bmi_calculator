import 'package:bmi_calculator/Screens/input_page.dart';
import 'package:bmi_calculator/Screens/result_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const InputPage(),
      routes: {
        '/first': (context) => const InputPage(),
      },
    );
  }
}
