import 'package:flutter/material.dart';

class DuyurularSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Duyurular',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              TextButton(
                onPressed: () {
                  // Duyuruların tamamını göster
                },
                child: Text('TÜMÜ'),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.campaign, color: Colors.orange, size: 32.0),
          title: Text('Belediye Başkan Adayları Site Daveti Hk.'),
          subtitle: Text('Değerli Site Sakinlerimiz...'),
          trailing: ElevatedButton(
            onPressed: () {
              // Duyuru detaylarına git
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: Text('DUYURU'),
          ),
        ),
        // Daha fazla ListTile duyuruları ekleyebilirsiniz.
      ],
    );
  }
}
