import 'package:bitirmeproje/screens/Diger%20Ekran/ziyaretci_ekle.dart';
import 'package:flutter/material.dart';

class ZiyaretciKaydiScreen extends StatelessWidget {
  const ZiyaretciKaydiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ziyaretçi Kaydı"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const YeniZiyaretciKaydiScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                  'assets/images/ziyaretci.jpg'), // Ensure this image asset exists
            ),
            const Text(
              "Ziyaretçi Kaydı Bulunmuyor.",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Kayıt bulunamadı.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
