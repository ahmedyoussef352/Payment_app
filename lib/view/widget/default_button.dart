// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:payment_app/core/constants/styles/color_app.dart';

class DefaultButton extends StatelessWidget {
  Widget buttonWidget;
  Function() function;
  double width;
  Color backgroundColor;
  bool isUpperCase;
  double radius;
  DefaultButton({
    super.key,
    required this.buttonWidget,
    required this.function,
    this.width = double.infinity,
    this.backgroundColor = blue,
    this.isUpperCase = true,
    this.radius = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: buttonWidget,
      ),
    );
  }
}
