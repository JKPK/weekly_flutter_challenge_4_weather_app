import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/city_transition_provider.dart';

class DaySummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DayCity(0),
        DayCity(1),
      ],
    );
  }
}

class DayCity extends StatelessWidget {
  final int city;

  DayCity(this.city);

  @override
  Widget build(BuildContext context) {
    return Consumer<CityTransitionProvider>(
      builder: (context, notifier, child) {
        double start = MediaQuery.of(context).size.width * .2;
        if (city < notifier.city) {
          start += 40;
        } else if (city > notifier.city) {
          start -= 40;
        }
        return Positioned(
          left: start + 40 * notifier.transitionProgress,
          top: MediaQuery.of(context).size.height * .13,
          width: MediaQuery.of(context).size.width * .6,
          child: Opacity(
            opacity: city == notifier.city
                ? (1 - notifier.transitionProgress.abs())
                : notifier.transitionProgress.abs(),
            child: child,
          ),
        );
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              city <1 ? "Cairo" : "Paris",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 15),
            Text(
              city <1 ? "Sunny, Sunday" : "Rainy, Sunday",
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
              ),
            ),
            SizedBox(height: 10),
            Text(
              city <1 ? " 16°" : " 11°",
              style: TextStyle(
                color: Colors.white,
                fontSize: 90,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
