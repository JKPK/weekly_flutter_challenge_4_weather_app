import 'package:flutter/material.dart';

class DaySummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * .2,
      top: MediaQuery.of(context).size.height * .13,
      width: MediaQuery.of(context).size.width * .6,
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              "Cairo",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Sunny, Sunday",
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
              ),
            ),
            SizedBox(height: 10),
            Text(
              " 16°",
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
