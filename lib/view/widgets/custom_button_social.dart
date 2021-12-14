import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final Function onPressed;
  final String imageName;
  final String buttonText;

  const CustomButtonSocial({
    Key? key,
    required this.onPressed,
    required this.imageName,
    required this.buttonText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: FlatButton(
        onPressed: () => onPressed(),
        child: Row(
          children: [
            Image.asset(imageName),
            const SizedBox(
              width: 90,
            ),
            CustomText(
              alignment: Alignment.center,
              text: buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
