import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';
import '../core/theme/ColorPalette.dart';

class Gridbottomsheet extends StatefulWidget {
  const Gridbottomsheet({super.key});

  @override
  State<Gridbottomsheet> createState() => _GridbottomsheetState();
}

class _GridbottomsheetState extends State<Gridbottomsheet> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    List<Widget> profileImages = [
      Assets.images.profile2.image(),
      Assets.images.profile3.image(),
      Assets.images.profile4.image(),
      Assets.images.profile5.image(),
      Assets.images.profile6.image(),
      Assets.images.profile7.image(),
      Assets.images.profile8.image(),
      Assets.images.profile1.image(),
      Assets.images.profile9.image(),
    ];
    return Container(
      color: Colorpalette.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.42,
          child: GridView.builder(
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    Navigator.pop(context, profileImages[index]);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Colorpalette.yellow
                        : Colorpalette.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colorpalette.yellow, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CircleAvatar(child: profileImages[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
