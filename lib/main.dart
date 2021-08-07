import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/pages/home_page.dart';

void main() {
  runApp(SpaceXLatestLaunchApp());
}

class SpaceXLatestLaunchApp extends StatelessWidget {
  const SpaceXLatestLaunchApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SpaceX Latest Launch",
      home: HomePage(),
    );
  }
}