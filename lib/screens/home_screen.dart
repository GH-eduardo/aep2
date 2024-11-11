import 'package:flutter/material.dart';
import 'package:aep2/screens/encryption_screen.dart';
import 'package:aep2/screens/decryption_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comunicação Segura')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EncryptionScreen()),
                );
              },
              child: const Text('Criptografar Email'),
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DecryptionScreen()),
                );
              },
              child: const Text('Descriptografar Email'),
            ),
          ],
        ),
      ),
    );
  }
}
