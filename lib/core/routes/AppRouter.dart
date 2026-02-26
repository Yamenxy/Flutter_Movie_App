import 'package:flutter/material.dart';
import '../../update_profile/update_profile.dart';
import 'PageRouteNames.dart';

abstract class Approuter {
  static Route<dynamic> onGenrateRoutes(RouteSettings settings){
    switch(settings.name){
      case Pageroutenames.updateScreen:
        return MaterialPageRoute(builder: (context)=>UpdateProfile(),settings: settings);
      default:
        return MaterialPageRoute(builder: (context)=>Placeholder());
    }
  }
}