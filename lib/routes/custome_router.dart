import 'package:da_ngon_ngu/pages/about_page.dart';
import 'package:da_ngon_ngu/pages/home_page.dart';
import 'package:da_ngon_ngu/pages/not_found.dart';
import 'package:da_ngon_ngu/pages/setting_page.dart';
import 'package:da_ngon_ngu/routes/route_name.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());
      case settingRoute:
        return MaterialPageRoute(builder: (_) => SettingPage());
    }
    return MaterialPageRoute(builder: (_) => NotFound());
  }
}
