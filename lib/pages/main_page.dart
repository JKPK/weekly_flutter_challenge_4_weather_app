import 'package:flutter/material.dart';
import 'package:weekly_flutter_challenge_4_weather_app/widgets/top_bar.dart';

import '../widgets/background.dart';
import '../widgets/notification_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          TopBar(),
          NotificationButton(),
        ],
      ),
    );
  }
}
