import 'package:flutter/material.dart';

class IlanOlusturScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İlan Oluştur"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Başlık",
                hintText: "Başlık giriniz",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: "Açıklama",
                hintText: "Açıklama giriniz",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: "Ad Soyad",
                hintText: "Adınızı ve soyadınızı giriniz",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Burada ilan yayınlama işlevi gerçekleştirilecek
                // Şimdilik basit bir onay mesajı göster
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Başarılı"),
                    content: Text("İlanınız başarıyla yayınlandı!"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Dialog'u kapat
                        },
                        child: Text("Tamam"),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Yayınla"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
