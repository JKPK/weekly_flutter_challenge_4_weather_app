import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../styleguide.dart';
import '../providers/city_transition_provider.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CityImage(0),
        CityImage(1),
        CityOverlay(0),
        CityOverlay(1),
        Positioned(
          top: MediaQuery.of(context).size.height / 2 * .85,
          child: ClipPath(
            clipper: BackgroundClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * .60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: backgroundColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height / 30);
    path.lineTo(size.width, size.height / 4);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class CityImage extends StatelessWidget {
  final int city;

  CityImage(this.city);
  @override
  Widget build(BuildContext context) {
    return Consumer<CityTransitionProvider>(
      builder: (context, notifier, child) {
        double heightModifier = notifier.city<1
            ? 30 * notifier.transitionProgress.abs()
            : (30 - 30 * notifier.transitionProgress.abs());

        return Opacity(
          opacity: city == notifier.city
              ? (1 - notifier.transitionProgress.abs())
              : notifier.transitionProgress.abs(),
          child: Container(
            height: MediaQuery.of(context).size.height * .6 + heightModifier,
            child: Image(
              fit: BoxFit.cover,
              image: city <1
                  ? AssetImage('assets/images/cairo.jpg')
                  : AssetImage('assets/images/paris.jpg'),
            ),
          ),
        );
      },
    );
  }
}

class CityOverlay extends StatelessWidget {
  final int city;

  CityOverlay(this.city);

  @override
  Widget build(BuildContext context) {
    return Consumer<CityTransitionProvider>(
      builder: (context, notifier, child) {
        return Opacity(
          opacity: city == notifier.city
              ? (1 - notifier.transitionProgress.abs())
              : notifier.transitionProgress.abs(),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  city <1
                      ? cairoColor.withOpacity(0.7)
                      : parisColor.withOpacity(0.7),
                  Colors.black.withOpacity(0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        );
      },
    );
  }
}
