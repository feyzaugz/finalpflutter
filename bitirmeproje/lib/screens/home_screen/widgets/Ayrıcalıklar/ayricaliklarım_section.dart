import 'package:flutter/material.dart';
import 'ayricalik_card.dart';

class AyricaliklarimSection extends StatelessWidget {
  const AyricaliklarimSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ayrıcalıklarım',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15.0),
          SizedBox(
            height: 200,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Yatayda tek öğe göstermek için
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
                childAspectRatio: 1, // Genişlik/yükseklik oranı
              ),
              itemBuilder: (context, index) {
                return AyricalikCard(
                  title: 'Başlık $index',
                  subtitle: 'Alt başlık $index',
                  iconData: Icons.star,
                  imagePath: 'assets/images/ayricalik.png',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
