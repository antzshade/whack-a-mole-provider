import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  Color mainColor = Color(0xff384250);
  MaterialColor materialMainColor = MaterialColor(0xff384250, {
    50: Color.fromRGBO(56, 66, 80, .1),
    100: Color.fromRGBO(56, 66, 80, .2),
    200: Color.fromRGBO(56, 66, 80, .3),
    300: Color.fromRGBO(56, 66, 80, .4),
    400: Color.fromRGBO(56, 66, 80, .5),
    500: Color.fromRGBO(56, 66, 80, .6),
    600: Color.fromRGBO(56, 66, 80, .7),
    700: Color.fromRGBO(56, 66, 80, .8),
    800: Color.fromRGBO(56, 66, 80, .9),
    900: Color.fromRGBO(56, 66, 80, 1),
  });
  Map<int, Color> listColor = {};

  String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.";

  void changeThemeColor(Color color) {
    mainColor = color;
    listColor = {
      50: mainColor.withOpacity(0.1),
      100: mainColor.withOpacity(0.2),
      200: mainColor.withOpacity(0.3),
      300: mainColor.withOpacity(0.4),
      400: mainColor.withOpacity(0.5),
      500: mainColor.withOpacity(0.6),
      600: mainColor.withOpacity(0.7),
      700: mainColor.withOpacity(0.8),
      800: mainColor.withOpacity(0.9),
      900: mainColor.withOpacity(1)
    };
    materialMainColor = MaterialColor(0xFF880E4F, listColor);

    notifyListeners();
  }

  Color getColorOpacity() {
    return mainColor.withOpacity(0.5);
  }
}
