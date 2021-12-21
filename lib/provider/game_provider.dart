import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameProvider with ChangeNotifier {
  List<bool> listData = [];
  int score = 0;

  bool checkData(int index) {
    if (index > 9) {
      return false;
    } else if (listData[index] == true) {
      score += 10;
    }
    generateRandom();
    notifyListeners();
    return true;
  }

  void resetData() {
    score = 0;
    notifyListeners();
  }

  void generateRandom() {
    listData = [];
    var rng = Random();
    var hasTrue = false;
    for (var i = 0; i < 9; i++) {
      var tempInt = rng.nextInt(3);
      if (tempInt == 1) {
        listData.add(true);
        hasTrue = true;
      } else {
        listData.add(false);
      }
    }
    if (hasTrue == false) {
      listData[0] = true;
    }
  }
}
