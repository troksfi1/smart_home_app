import 'package:caravan_app/screens/co2/co2_screen.dart';
import 'package:caravan_app/screens/humidity/humidity_screen.dart';
import 'package:caravan_app/screens/settings/settings_screen.dart';
import 'package:caravan_app/screens/temperature/temperature_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:caravan_app/screens/home/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  Temperature.routeName: (context) => Temperature(),
  Settings.routeName: (context) => Settings(),
  CO2.routeName: (context) => CO2(),
  Humidity.routeName: (context) => Humidity(),
};
