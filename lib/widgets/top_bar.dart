import 'package:flutter/material.dart';

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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: MediaQuery.of(context).size.width * .025,
                height: MediaQuery.of(context).size.width * .025,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 1),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: MediaQuery.of(context).size.width * .03,
                height: MediaQuery.of(context).size.width * .03,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 1),
                ),
              ),
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
