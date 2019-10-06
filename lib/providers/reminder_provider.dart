import 'package:flutter/material.dart';

class ReminderProvider extends ChangeNotifier {
  int currentDay = 0;
  List<String> reminders = ["Carry umbrella", "Wear sunglasses"];
  List<int> activeReminders = [];

  set day(int day) {
    this.currentDay = day;
    notifyListeners();
  }

  set reminder(int reminder) {
    activeReminders.add(reminder);
    notifyListeners();
  }

  void addReminder(String reminderText) {
    reminders.add(reminderText);
    this.reminder = reminders.length - 1;
  }
}
