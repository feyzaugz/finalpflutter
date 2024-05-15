import 'package:flutter/material.dart';

class RezervasyonScreen extends StatelessWidget {
  const RezervasyonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rezervasyon'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                    'assets/images/rezervasyon.jpg'), // Make sure you have this image in your assets
              ),
              const Text(
                'Rezervasyon menüsü ile:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                '• Sitenizde bulunan ortak tesisleri görür,',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                '• Uygun saatler için rezervasyon oluşturabilirsiniz.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Rezervasyon menüsü, sitenizde kapalı. Kullanmak için yönetiminiz ile iletişime geçiniz.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
