import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aep2/services/encryption_service.dart';

class DecryptionScreen extends StatefulWidget {
  const DecryptionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DecryptionScreenState createState() => _DecryptionScreenState();
}

class _DecryptionScreenState extends State<DecryptionScreen> {
  final _controller = TextEditingController();
  String _decryptedText = '';

  void _decryptText() {
    setState(() {
      _decryptedText = EncryptionService.decrypt(_controller.text);
    });
  }

  void _copyDecryptedText() {
    Clipboard.setData(ClipboardData(text: _decryptedText));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text(
              'Texto descriptografado copiado para a área de transferência!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Descriptografar Email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              minLines: 3,
              maxLines: 6,
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Digite o texto a ser descriptografado',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _decryptText,
              child: const Text('Descriptografar'),
            ),
            const SizedBox(height: 16),
            if (_decryptedText.isNotEmpty) ...[
              Text('Texto descriptografado : $_decryptedText'),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _copyDecryptedText,
                child: const Text('Copiar texto descriptografado'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
