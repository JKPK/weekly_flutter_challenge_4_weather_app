import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/city_transition_provider.dart';

class TemperatureSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: MediaQuery.of(context).size.width * .10,
      top: MediaQuery.of(context).size.height * .44,
      width: MediaQuery.of(context).size.width * .3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Temperature(true, 19, 0, true),
              Temperature(true, 12, 1, true),
            ],
          ),
          SizedBox(width: 10),
          Temperature(false, 9, 0, false),
        ],
      ),
    );
  }
}

class Temperature extends StatelessWidget {
  final bool temperatureRise;
  final int temperature;
  final int city;
  final bool animate;
  Temperature(this.temperatureRise, this.temperature, this.city, this.animate);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          temperatureRise ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: Colors.white,
          size: 30,
        ),
        Container(
          width: 40,
          height: 40,
          child: Stack(
            children: <Widget>[
              Consumer<CityTransitionProvider>(
                builder: (context, notifier, child) {
                  int start = 0;
                  if (city < notifier.city) {
                    start = 10;
                  } else if (city > notifier.city) {
                    start = -10;
                  }
                  return Positioned(
                    top: animate
                        ? (city == notifier.city
                            ? (10 * notifier.transitionProgress)
                            : (start + 10 * notifier.transitionProgress))
                        : 0,
                    child: Opacity(
                      opacity: animate
                          ? (city == notifier.city
                              ? (1 - notifier.transitionProgress.abs())
                              : notifier.transitionProgress.abs())
                          : 1,
                      child: child,
                    ),
                  );
                },
                child: Text(
                  " $temperature°",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
