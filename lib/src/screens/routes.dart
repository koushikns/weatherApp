import 'package:flutter/material.dart';
import 'package:flutter_weather/src/screens/settings_screen.dart';
import 'package:flutter_weather/src/screens/weather_screen.dart';
import 'package:flutter_weather/src/widgets/splashScreen.dart';

class Routes {

  static final mainRoute = <String, WidgetBuilder>{
    '/home': (context) => SplashScreen(),
    '/settings': (context) => SettingsScreen(),
  };
}
