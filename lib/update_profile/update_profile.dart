import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/CloudFireStoreUtils.dart';
import 'package:movies_app/models/profileModel.dart';

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
  bool isInitialized = false;
  Profilemodel? profilemodel;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  bool isEnabled = false;
  String? selectedImage;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Avatar"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: StreamBuilder<Profilemodel?>(
        stream: Cloudfirestoreutils.getProfileStream("user1"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("No Data Exists"));
          }
          final profile = snapshot.data;
          if (!isInitialized) {
            nameController.text = profile?.name ?? "";
            phoneController.text = profile?.phone ?? "";
            isInitialized = true;
          }
          return Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 40),
                    CircleAvatar(
                      radius: 100,
                      child: InkWell(
                        overlayColor: WidgetStatePropertyAll(
                          Colors.transparent,
                        ),
                        onTap: () {
                          setState(() {
                            _showGridBottomSheet(context);
                          });
                        },
                        child: selectedImage == null
                            ? (profile?.image!=null? Image.asset(profile!.image!):Assets.images.profile1.image()):Image.asset(selectedImage!),
                      ),
                    ),
                    SizedBox(height: 20),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Customtextformfield(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter name";
                                }
                                return null;
                              },
                              controller: nameController,
                              icon: Assets.icons.userIcn.svg(),
                            ),
                            SizedBox(height: 20),
                            Customtextformfield(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return "Enter your phone";
                                }
                                return null;
                              },
                              controller: phoneController,
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
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  Profilemodel data = Profilemodel(
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    image: selectedImage,
                                    id: "user1",
                                  );
                                      await Cloudfirestoreutils.updateProfile(
                                        data,
                                      );
                                  Navigator.pop(context, selectedImage);
                                }
                              },
                              forGroundColor: Colorpalette.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
