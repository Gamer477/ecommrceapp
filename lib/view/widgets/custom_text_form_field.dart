import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final String hintText;
  final Function(dynamic value) onSave;
  final Function(dynamic value) validator;
  const CustomTextFormField({
    Key? key,
    this.text = '',
    this.hintText = '',
    required this.onSave,
    required this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14,
          color: Colors.grey.shade900,
        ),
        TextFormField(
          onSaved: (val) => onSave(val),
          validator: (val) => validator(val),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black,
            ),
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
