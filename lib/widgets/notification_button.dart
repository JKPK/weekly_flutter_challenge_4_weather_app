import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../styleguide.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * .1,
      top: MediaQuery.of(context).size.height * .43,
      child: Container(
        width: MediaQuery.of(context).size.width * .15,
        height: MediaQuery.of(context).size.width * .15,
        decoration: BoxDecoration(
          color: parisColor,
          shape: BoxShape.circle,
        ),
        child: Transform.rotate(
          angle: -math.pi * .15,
          child: Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    );
  }
}
