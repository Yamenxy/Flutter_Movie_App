import 'package:flutter/material.dart';

import '../core/gen/assets.gen.dart';
import '../core/theme/ColorPalette.dart';
import '../widgets/CustomElevatedButton.dart';
import '../widgets/CustomTextFormField.dart';
import '../widgets/GridBottomSheet.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}
///

class _UpdateProfileState extends State<UpdateProfile> {
  Widget? selectedImage;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Avatar"),
        leading: Icon(Icons.arrow_back_sharp),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            CircleAvatar(
              radius: 100,
              child: InkWell(
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
                onTap: () {
                  setState(() {
                    _showGridBottomSheet(context);
                  });
                },
                child: selectedImage ?? Assets.images.profile1.image(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Customtextformfield(
                      text: "John Safwat",
                      icon: Assets.icons.userIcn.svg(),
                    ),
                    SizedBox(height: 20),
                    Customtextformfield(
                      text: "01200000000",
                      icon: Assets.icons.phoneIcn.svg(),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                      ),
                      child: Text(
                        "Reset Password",
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Customelevatedbutton(
              backGroundColor: Colorpalette.red,
              buttonText: "Delete Account",
              onPressed: () {},
              forGroundColor: Colorpalette.mainTextColor,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Customelevatedbutton(
                backGroundColor: Colorpalette.yellow,
                buttonText: "Update Data",
                onPressed: () {},
                forGroundColor: Colorpalette.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showGridBottomSheet(BuildContext context) async {
    final Image = await showModalBottomSheet(
      context: context,
      builder: (context) => Gridbottomsheet(),
    );
    if (Image != null) {
      setState(() {
        selectedImage = Image;
      });
    }
  }
}
