import 'package:bitirmeproje/screens/home_screen/widgets/ayricaliklar/providers/privileges_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ayricalik_card.dart';

class AyricaliklarimSection extends ConsumerWidget {
  const AyricaliklarimSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final privileges = ref.watch(privilegesProvider);
    if (privileges.isEmpty) {
      return const SizedBox.shrink();
    }
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
              itemCount: privileges.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Yatayda tek öğe göstermek için
                crossAxisSpacing: 20,
                mainAxisSpacing: 15,
                childAspectRatio: 1, // Genişlik/yükseklik oranı
              ),
              itemBuilder: (context, index) {
                return AyricalikCard(privilege: privileges[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
