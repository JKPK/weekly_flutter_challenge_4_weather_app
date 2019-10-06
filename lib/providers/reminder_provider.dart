import 'package:flutter/material.dart';

class ReminderProvider extends ChangeNotifier {
  int currentDay = 0;

  set day(int day) {
    this.currentDay = day;
    notifyListeners();
  }
}
