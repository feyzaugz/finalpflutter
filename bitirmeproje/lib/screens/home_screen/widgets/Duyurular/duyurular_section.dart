import 'package:bitirmeproje/screens/home_screen/widgets/Duyurular/duyurular_t%C3%BCm%C3%BC.dart';
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
              const Text(
                'Duyurular',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DuyurularScreen()),
                  );
                },
                child: const Text('TÜMÜ'),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.campaign, color: Colors.orange, size: 32.0),
          title: const Text('Belediye Başkan Adayları Site Daveti Hk.'),
          subtitle: const Text('Değerli Site Sakinlerimiz...'),
          trailing: ElevatedButton(
            onPressed: () {
              // Duyuru detaylarına git
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.orange,
              // primary: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: const Text('DUYURU'),
          ),
        ),
        // Daha fazla ListTile duyuruları ekleyebilirsiniz.
      ],
    );
  }
}
