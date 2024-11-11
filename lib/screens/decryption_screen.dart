import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aep2/services/encryption_service.dart';

class DecryptionScreen extends StatefulWidget {
  @override
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
      SnackBar(
          content: Text(
              'Texto descriptografado copiado para a área de transferência!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Descriptografar Email')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              maxLines: 6,
              minLines: 3,
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Digite o texto a ser descriptografado',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _decryptText,
              child: Text('Descriptografar'),
            ),
            SizedBox(height: 16),
            if (_decryptedText.isNotEmpty) ...[
              Text('Texto descriptografado : $_decryptedText'),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: _copyDecryptedText,
                child: Text('Copiar texto descriptografado'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
