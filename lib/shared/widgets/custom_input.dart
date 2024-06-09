import 'package:flutter/material.dart';
import 'package:endurance_app/theme/colors.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final double fontSize;
  final Color cursorColor;
  final double cursorHeight;
  final TextInputType keyboardType;
  final bool readOnly;
  final int minLines;
  final int? maxLines; // Allow null and use it for multi-line text fields
  TextEditingController? controller;
  CustomInput({
    required this.hintText,
    this.fontSize = 15.0,
    this.cursorColor = CustomColors.displayLarge,
    this.cursorHeight = 17.0,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.controller,
    this.minLines = 1,
    this.maxLines, // Now maxLines can be passed as null for single-line fields
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0, // Remove fixed height or make it null for multi-line fields
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: fontSize),
        cursorColor: cursorColor,
        cursorHeight: cursorHeight,
        keyboardType: keyboardType,
        readOnly: readOnly,
        minLines: 1,
        maxLines:
            maxLines ?? 1, // Use the passed maxLines value or default to 1
        textInputAction:
            maxLines == null ? TextInputAction.done : TextInputAction.newline,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(22.0)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(22.0)),
        ),
      ),
    );
  }
}
