import 'package:flutter/material.dart';

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
          Temperature(true, 19),
          SizedBox(width: 10),
          Temperature(false, 9),
        ],
      ),
    );
  }
}

class Temperature extends StatelessWidget {
  final bool temperatureRise;
  final int temperature;

  Temperature(this.temperatureRise, this.temperature);

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
    );
  }
}
