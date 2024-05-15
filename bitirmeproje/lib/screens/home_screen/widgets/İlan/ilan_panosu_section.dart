import 'package:bitirmeproje/core/models/advert.dart';
import 'package:bitirmeproje/screens/home_screen/widgets/%C4%B0lan/providers/ilanlar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ilan_card.dart';
import 'ilan_detay_screen.dart';
import 'ilan_olustur.dart';

Map<String, IconData> iconMap = {
  'brush': Icons.brush,
  'school': Icons.school,
  'gamepad': Icons.gamepad,
};

class IlanPanosuSection extends ConsumerWidget {
  const IlanPanosuSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Advert> ilanlar = ref.watch(ilanlarProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('İlan Panosu',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 160, // Kartların yüksekliği
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ilanlar.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IlanDetayScreen(
                          advert: ilanlar[index],
                        ),
                      ),
                    );
                  },
                  child: IlanCard(
                    title: ilanlar[index].title,
                    icon: iconMap[ilanlar[index].icon] ?? Icons.error,
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  // Tüm ilanları gösterme işlevi
                },
                child: const Text('TÜMÜ', style: TextStyle(color: Colors.blue)),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => IlanOlusturScreen()),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Oluştur'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
