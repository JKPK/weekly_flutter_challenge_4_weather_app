import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/main_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
      ),
      title: "Weekly Flutter Challenge 4",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
