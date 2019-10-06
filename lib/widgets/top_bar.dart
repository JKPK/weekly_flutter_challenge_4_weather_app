import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/city_transition_provider.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 40,
          left: 20,
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 35,
          ),
        ),
        Positioned(
          top: 52,
          left: 0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Dot(0),
              Dot(1),
            ],
          ),
        ),
        Positioned(
          top: 40,
          right: 20,
          child: Icon(
            Icons.settings,
            color: Colors.white,
            size: 35,
          ),
        ),
      ],
    );
  }
}

class Dot extends StatelessWidget {
  final int city;

  Dot(this.city);

  @override
  Widget build(BuildContext context) {
    return Consumer<CityTransitionProvider>(
      builder: (context, notifier, child) {
        double sizeAddition = city == notifier.city
            ? (MediaQuery.of(context).size.width *
                .005 *
                notifier.transitionProgress.abs())
            : (MediaQuery.of(context).size.width * .005 -
                MediaQuery.of(context).size.width *
                    .005 *
                    notifier.transitionProgress.abs());

        double opacity = city == notifier.city
            ? (1 - notifier.transitionProgress.abs())
            : notifier.transitionProgress.abs();

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: MediaQuery.of(context).size.width * .025 + sizeAddition,
          height: MediaQuery.of(context).size.width * .025 + sizeAddition,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(opacity),
            border: Border.all(color: Colors.white, width: 1),
          ),
        );
      },
    );
  }
}
