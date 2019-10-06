import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../styleguide.dart';
import '../providers/CityTransitionProvider.dart';

class WeekTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: MediaQuery.of(context).size.height / 2 * 1.15,
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
                        color: buttonColor,
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
                  onHorizontalDragUpdate: (DragUpdateDetails details) {
                    Provider.of<CityTransitionProvider>(context, listen: false)
                        .addTransitionProgress(details.delta.dx /
                            (MediaQuery.of(context).size.width * .5));
                  },
                  onHorizontalDragEnd: (x) {
                    Provider.of<CityTransitionProvider>(context, listen: false)
                        .endTransition();
                  },
                  onHorizontalDragCancel: () {
                    Provider.of<CityTransitionProvider>(context, listen: false)
                        .endTransition();
                  },
                  onHorizontalDragStart: (x) {
                    Provider.of<CityTransitionProvider>(context, listen: false)
                        .endTransition();
                  },
                  child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width - 40,
                    color: backgroundColor,
                    child: Stack(
                      children: <Widget>[
                        TableCity(0),
                        TableCity(1),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2 * 1.15 + 78,
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

class TableCity extends StatelessWidget {
  final int city;

  TableCity(this.city);

  @override
  Widget build(BuildContext context) {
    return Consumer<CityTransitionProvider>(
      builder: (context, notifier, child) {
        int start = 0;
        if (city < notifier.city) {
          start = 20;
        } else if (city > notifier.city) {
          start = -20;
        }
        return Positioned(
          top: 0,
          left: city == notifier.city
              ? (20 * notifier.transitionProgress)
              : (start + 20 * notifier.transitionProgress),
          child: Opacity(
            opacity: city == notifier.city
                ? (1 - notifier.transitionProgress.abs())
                : notifier.transitionProgress.abs(),
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width * .85,
              child: child,
            ),
          ),
        );
      },
      child: Column(
        children: <Widget>[
          DayRow("Monday", city < 1 ? Weather.sunny : Weather.cloudy,
              city < 1 ? 20 : 12, city < 1 ? 10 : 9),
          DayRow("Tuesday", city < 1 ? Weather.partly_cloudy : Weather.rainy,
              city < 1 ? 20 : 11, city < 1 ? 11 : 4),
          DayRow("Wednesday", Weather.sunny, city < 1 ? 22 : 12,
              city < 1 ? 12 : 7),
          DayRow("Thursday", city < 1 ? Weather.sunny : Weather.rainy,
              city < 1 ? 21 : 9, city < 1 ? 10 : 4),
          DayRow("Friday", Weather.partly_cloudy, city < 1 ? 20 : 11,
              city < 1 ? 11 : 9)
        ],
      ),
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
