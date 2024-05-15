import 'package:flutter/material.dart';

class SendMessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Mesaj Gönder'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Mesajınızı buraya yazın...',
                  border: OutlineInputBorder(),
                ),
                maxLines: null, 
                keyboardType: TextInputType.multiline,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement message send functionality
              },
              child: const Text('Gönder'),
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.amberAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
