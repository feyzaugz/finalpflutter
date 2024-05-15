import 'package:bitirmeproje/core/models/privilege.dart';
import 'package:flutter/material.dart';

class AyricalikCard extends StatelessWidget {
  final Privilege privilege;

  const AyricalikCard({
    Key? key,
    required this.privilege,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0), // Kart aralarında boşluk verir
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // İçerikleri baştan başlat
        mainAxisSize: MainAxisSize.min, // İçeriğin boyutuna göre küçült
        children: <Widget>[
          Image.network(
            privilege.image,
            height: 120, // Resim yüksekliğini sabit bir değere ayarla
            width: double.infinity, // Genişliği tam kapla
            fit: BoxFit.cover, // Resmi uygun şekilde ölçeklendir
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  privilege.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(privilege.subtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
