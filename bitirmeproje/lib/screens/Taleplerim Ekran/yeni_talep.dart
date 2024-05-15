import 'package:flutter/material.dart';

class YeniTalepScreen extends StatefulWidget {
  const YeniTalepScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _YeniTalepScreenState createState() => _YeniTalepScreenState();
}

class _YeniTalepScreenState extends State<YeniTalepScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yeni Talep'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Konu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Daire',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              items: ['Arıza', 'Soru', 'Öneri', 'Şikayet', 'İstek/Talep', 'Memnuniyet', 'Diğer'].map((String category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? value) {},
              decoration: const InputDecoration(
                labelText: 'İstek Tipi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16), 
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Açıklama',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Kaydet'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
