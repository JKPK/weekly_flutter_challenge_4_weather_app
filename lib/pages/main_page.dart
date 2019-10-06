import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../widgets/background.dart';
import '../widgets/notification_button.dart';
import '../widgets/day_summary.dart';
import '../widgets/temperature_summary.dart';
import '../widgets/top_bar.dart';
import '../widgets/week_table.dart';
import '../providers/CityTransitionProvider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([
    ]);

    return Scaffold(
      body: ChangeNotifierProvider(
        builder: (context) => CityTransitionProvider(2),
        child: Stack(
          children: <Widget>[
            Background(),
            TopBar(),
            DaySummary(),
            TemperatureSummary(),
            NotificationButton(),
            WeekTable(),
          ],
        ),
      ),
    );
  }
}
