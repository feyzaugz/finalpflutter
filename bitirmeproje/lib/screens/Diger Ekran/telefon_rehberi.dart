import 'package:flutter/material.dart';

class TelefonRehberiScreen extends StatelessWidget {
  const TelefonRehberiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Telefon Rehberi"),
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.asset('assets/images/rehber.jpg'), // Ensure you have this image in your assets
            ),
            const Text(
              "Telefon Rehberi Kaydı Bulunmuyor.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Henüz bir telefon rehberi kaydı bulunmuyor.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
