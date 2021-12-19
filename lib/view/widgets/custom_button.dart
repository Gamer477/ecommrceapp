import 'package:flutter/material.dart';

import '../../constants.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  final Color color;
  final Color textColor;
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.color = primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: primaryColor,
      padding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: () => onPressed(),
      highlightColor: color,
      child: CustomText(
        text: buttonText,
        color: textColor,
        alignment: Alignment.center,
      ),
    );
  }
}
