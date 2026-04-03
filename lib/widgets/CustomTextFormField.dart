import 'package:flutter/material.dart';

import '../core/theme/ColorPalette.dart';

class Customtextformfield extends StatefulWidget {
  final Widget icon;
   final TextEditingController controller;
  final String? Function(String?)? validator;
  const Customtextformfield({super.key, required this.icon, required this.controller, this.validator,});

  @override
  State<Customtextformfield> createState() => _CustomtextformfieldState();
}

class _CustomtextformfieldState extends State<Customtextformfield> {

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme=Theme.of(context).textTheme;
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      style: textTheme.titleLarge,
      decoration: InputDecoration(
        prefixIcon:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: widget.icon,
        ) ,
        filled: true,
        fillColor: Colorpalette.grey,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide.none),

      ),
    );
  }
}
