import 'package:flutter/material.dart';

///class SplashScreen extends StatelessWidget{
///const SplashScreen({super.key});
import 'dart:async';

import 'package:movies_app/core/theme/ColorPalette.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // هنا بنعمل Timer
    Timer(const Duration(seconds: 3), () {
      // بعد 3 ثواني نعمل navigate للشاشة التالية
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorpalette.primaryColor,
      body:
      SafeArea(
        child: Column(
          children: [
            const Spacer(),  // يأخذ مساحة فارغة من الأعلي
            Center(
              // يضمن ان الشعار في منتصف العرض تماما
              child: Image.asset('assets/images/Group 44.png',
                width: MediaQuery.of(context).size.width*0.6,
              ),),
            Spacer(),
            Image.asset('assets/images/Mask group.png',
              width: 120,),
            const SizedBox(height: 16),
            const Text(
              'Supervised by Mohamed Nabil',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight:FontWeight.w400,
              ),

            ),


            const SizedBox(height: 24,),
          ],
        ),
      ),
    );


  }

}