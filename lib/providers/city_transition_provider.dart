import 'package:flutter/material.dart';

class CityTransitionProvider extends ChangeNotifier {
  double transitionProgress = 0;
  int city = 0;
  final int maxCities;

  CityTransitionProvider(this.maxCities);

  addTransitionProgress(double delta) {
    transitionProgress += delta;

    if ((transitionProgress < 0 && city == 0) ||
        (transitionProgress > 0 && city >= (maxCities - 1))) {
      transitionProgress = 0;
    }

    if (transitionProgress >= 1 && city < (maxCities - 1)) {
      city++;
      transitionProgress = 0;
    } else if (transitionProgress <= -1 && city > 0) {
      city--;
      transitionProgress = 0;
    }
    if (transitionProgress.abs() > 1) {
      transitionProgress = transitionProgress.round() * 1.0;
    }
    notifyListeners();
  }

  endTransition() {
    if (transitionProgress > .5 && city < (maxCities - 1)) {
      city++;
    } else if (transitionProgress < -.5 && city > 0) {
      city--;
    }
    transitionProgress = 0;
    notifyListeners();
  }
}
