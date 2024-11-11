import 'package:flutter/material.dart';
import 'package:aep2/screens/encryption_screen.dart';
import 'package:aep2/screens/decryption_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comunicação Segura')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EncryptionScreen()),
                );
              },
              child: Text('Criptografar Email'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DecryptionScreen()),
                );
              },
              child: Text('Descriptografar Email'),
            ),
          ],
        ),
      ),
    );
  }
}
