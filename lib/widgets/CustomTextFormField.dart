import 'package:flutter/material.dart';

import '../core/theme/ColorPalette.dart';

class Customtextformfield extends StatelessWidget {
  final Widget icon;
  final String text;
  const Customtextformfield({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    return TextFormField(
      decoration: InputDecoration(
        hintText: text,
        hintStyle: textTheme.titleLarge,
        prefixIcon:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: icon,
        ) ,
        filled: true,
        fillColor: Colorpalette.grey,
          enabled: false,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),

      ),
    );
  }
}
