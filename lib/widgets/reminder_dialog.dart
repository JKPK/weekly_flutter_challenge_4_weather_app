import 'package:flutter/material.dart';

import '../styleguide.dart';

class ReminderDialog extends StatefulWidget {
  final List<String> reminders;

  @override
  ReminderDialog(this.reminders);

  @override
  _ReminderDialogState createState() => _ReminderDialogState();
}

class _ReminderDialogState extends State<ReminderDialog> {
  int currentReminder;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        titlePadding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Cancel",
              style: dialogTextStyle,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text(
              "Set Reminder",
              style: dialogTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        title: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * .8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            color: parisColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 5.0,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  "Tuesday,",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "29/01",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Image(
                  width: 30,
                  image: AssetImage("assets/icons/rainy_white.png"),
                )
              ],
            ),
          ),
        ),
        content: ConstrainedBox(
          constraints: new BoxConstraints(
            maxHeight: 300,
          ),
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                for (var i = 0; i < widget.reminders.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 10.0,
                      top: 5.0,
                      bottom: 5.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(widget.reminders[i],
                            style: TextStyle(fontSize: 20)),
                        Spacer(),
                        Radio(
                          value: i,
                          groupValue: currentReminder,
                          onChanged: (int i) => _changeSelectedReminder(i),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 10.0,
                    top: 5.0,
                    bottom: 5.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontSize: 20,
                            ),
                            hintText: "Add Something...",
                          ),
                        ),
                      ),
                      Radio(
                        value: widget.reminders.length,
                        groupValue: currentReminder,
                        onChanged: (_) =>
                            _changeSelectedReminder(widget.reminders.length),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _changeSelectedReminder(newReminder) {
    setState(() {
      currentReminder = newReminder;
    });
    print(currentReminder);
  }
}
