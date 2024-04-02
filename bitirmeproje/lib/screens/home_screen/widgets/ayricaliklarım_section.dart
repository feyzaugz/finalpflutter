import 'package:flutter/material.dart';

import 'ayricalik_card.dart';

class AyricaliklarimSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ayrıcalıklarım',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4, // Örnek olarak 4 tane ayrıcalık olduğunu varsayıyorum
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio:
                  1 / 1, // Kare şeklinde kartlar için aspect ratio
            ),
            itemBuilder: (context, index) {
              // Dummy data ile örnek bir kart oluşturuyorum
              // Gerçek uygulamada burada ayrıcalıkların bir listesi olacak
              return AyricalikCard(
                title: 'Başlık $index',
                subtitle: 'Alt başlık $index',
                iconData: Icons.star,
                imagePath: '',
              );
            },
          ),
        ],
      ),
    );
  }
}
