import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../styleguide.dart';
import '../providers/reminder_provider.dart';
import '../widgets/reminder_dialog.dart';


class NotificationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> reminders =
        Provider.of<ReminderProvider>(context, listen: false).reminders;

    return Positioned(
      left: MediaQuery.of(context).size.width * .1,
      top: MediaQuery.of(context).size.height * .43,
      child: Material(
        shape: CircleBorder(),
        clipBehavior: Clip.antiAlias,
        color: parisColor,
        elevation: 7,
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ReminderDialog(reminders);
              },
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * .15,
            height: MediaQuery.of(context).size.width * .15,
            child: Transform.rotate(
              angle: -math.pi * .15,
              child: Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
