// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton(this.text, this.changingscreen, {super.key});
  String text;
  Function changingscreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changingscreen();
      },
      child: Container(
        color: kBottomecardcolor,
        padding: const EdgeInsets.only(bottom: 20.0),
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
        child: Center(
          child: Text(
            text,
            style: kLargebuttontextstyle,
          ),
        ),
      ),
    );
  }
}
