import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aep2/services/encryption_service.dart';

class EncryptionScreen extends StatefulWidget {
  const EncryptionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EncryptionScreenState createState() => _EncryptionScreenState();
}

class _EncryptionScreenState extends State<EncryptionScreen> {
  final _controller = TextEditingController();
  String _encryptedText = '';

  void _encryptText() {
    setState(() {
      _encryptedText = EncryptionService.encrypt(_controller.text);
    });
  }

  void _copyEncryptedText() {
    Clipboard.setData(ClipboardData(text: _encryptedText));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text(
              'Texto criptografado copiado para a área de transferência!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criptografar Email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              minLines: 3,
              maxLines: 6,
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Digite o texto a ser criptografado',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _encryptText,
              child: const Text('Criptografar'),
            ),
            const SizedBox(height: 16),
            if (_encryptedText.isNotEmpty) ...[
              Text('Texto Criptografado: $_encryptedText'),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _copyEncryptedText,
                child: const Text('Copiar texto criptografado'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
