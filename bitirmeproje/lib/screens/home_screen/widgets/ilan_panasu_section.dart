import 'package:flutter/material.dart';

import 'ilan_card.dart';

class IlanPanosuSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'İlan Panosu',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          IlanCard(title: 'Badanacı', icon: Icons.brush),
          IlanCard(
              title: 'ÖZEL DERS / Yüzme, Matematik, İngilizce',
              icon: Icons.school),
          IlanCard(
              title: 'Mobil Oyun, Üretkenlik ve Hobi', icon: Icons.gamepad),
          // Daha fazla ilan card eklenebilir
          TextButton(
            onPressed: () {
              // Tüm ilanları gösterme işlevi
            },
            child: Text(
              'TÜMÜ',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton.icon(
            onPressed: () {
              // İlan ekleme işlevi
            },
            icon: Icon(Icons.add),
            label: Text('Oluştur'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              onPrimary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
