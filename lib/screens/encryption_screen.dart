import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aep2/services/encryption_service.dart';

class EncryptionScreen extends StatefulWidget {
  @override
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
      SnackBar(
          content: Text(
              'Texto criptografado copiado para a área de transferência!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criptografar Email')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              maxLines: 6,
              minLines: 3,
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Digite o texto a ser criptografado',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _encryptText,
              child: Text('Criptografar'),
            ),
            SizedBox(height: 16),
            if (_encryptedText.isNotEmpty) ...[
              Text('Texto Criptografado: $_encryptedText'),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: _copyEncryptedText,
                child: Text('Copiar texto criptografado'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
