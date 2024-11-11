import 'package:flutter/material.dart';
import 'package:aep2/screens/home_screen.dart';

void main() {
  runApp(PhishingDetectorApp());
}

class PhishingDetectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phishing Detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
