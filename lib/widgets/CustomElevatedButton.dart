import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customelevatedbutton extends StatelessWidget {
  final Color backGroundColor;
  final Color forGroundColor;
  final String buttonText;
  final void Function() onPressed;
  const Customelevatedbutton({
    super.key,
    required this.backGroundColor,
    required this.buttonText,
    required this.onPressed,
    required this.forGroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
          backgroundColor: WidgetStatePropertyAll(backGroundColor),
          foregroundColor: WidgetStatePropertyAll(forGroundColor),
        ),
        child: Text(buttonText,style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,fontFamily: "Roboto" ),),
      ),
    );
  }
}
