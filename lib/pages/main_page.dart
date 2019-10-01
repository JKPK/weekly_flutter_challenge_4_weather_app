import 'package:flutter/material.dart';

import '../widgets/background.dart';
import '../widgets/notification_button.dart';
import '../widgets/day_summary.dart';
import '../widgets/temperature_summary.dart';
import '../widgets/top_bar.dart';
import '../widgets/week_table.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          TopBar(),
          DaySummary(),
          TemperatureSummary(),
          NotificationButton(),
          WeekTable(),
        ],
      ),
    );
  }
}
