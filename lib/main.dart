import 'package:flutter/material.dart';
import 'package:aep2/screens/home_screen.dart';

void main() {
  runApp(const PhishingDetectorApp());
}

class PhishingDetectorApp extends StatelessWidget {
  const PhishingDetectorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phishing Detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
