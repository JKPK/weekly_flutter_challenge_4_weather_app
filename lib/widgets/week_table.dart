import 'package:flutter/material.dart';

import '../styleguide.dart';

class WeekTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 20,
          left: 0,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFE8E8E8),
                      ),
                      child: Text(
                        "0 reminders",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: MediaQuery.of(context).size.width * .24,
                      child: Text(
                        "Max/Min",
                        style: weekTableTextStyle,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                GestureDetector(
                  onHorizontalDragUpdate: (DragUpdateDetails detais) {
                  },
                  child: Column(
                    children: <Widget>[
                      DayRow("Monday", Weather.sunny, 20, 10),
                      DayRow("Tuesday", Weather.partly_cloudy, 20, 11),
                      DayRow("Wednesday", Weather.sunny, 22, 12),
                      DayRow("Thursday", Weather.sunny, 21, 10),
                      DayRow("Friday", Weather.partly_cloudy, 20, 11)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 262,
          left: 35,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: MediaQuery.of(context).size.width * .025,
            height: MediaQuery.of(context).size.width * .025,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class DayRow extends StatelessWidget {
  final String day;
  final Weather weather;
  final int maxTemperature;
  final int minTemperature;

  DayRow(
    this.day,
    this.weather,
    this.maxTemperature,
    this.minTemperature,
  );

  @override
  Widget build(BuildContext context) {
    AssetImage image;
    switch (weather) {
      case Weather.cloudy:
        image = AssetImage('assets/icons/cloudy.png');
        break;
      case Weather.partly_cloudy:
        image = AssetImage('assets/icons/partly_cloudy.png');
        break;
      case Weather.rainy:
        image = AssetImage('assets/icons/rainy.png');
        break;
      case Weather.sunny:
        image = AssetImage('assets/icons/sunny.png');
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * .1,
          ),
          Expanded(
            child: Container(
              child: Text(
                "$day",
                style: weekTableTextStyle,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .1,
            child: Center(
              child: Image(
                width: 25,
                image: image,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .05,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .12,
            child: Text(
              "$maxTemperature°",
              style: weekTableTextStyle,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .12,
            child: Text(
              "$minTemperature°",
              style: weekTableTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

enum Weather {
  cloudy,
  partly_cloudy,
  rainy,
  sunny,
}
