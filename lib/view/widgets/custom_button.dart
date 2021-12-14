import 'package:flutter/material.dart';

import '../../constants.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
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
      child: CustomText(
        text: buttonText,
        color: Colors.white,
        alignment: Alignment.center,
      ),
    );
  }
}
