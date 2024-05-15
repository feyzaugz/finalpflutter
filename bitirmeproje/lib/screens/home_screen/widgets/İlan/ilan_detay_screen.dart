import 'package:bitirmeproje/core/models/advert.dart';
import 'package:bitirmeproje/screens/home_screen/widgets/mesaj_g%C3%B6nder.dart';
import 'package:flutter/material.dart';

class IlanDetayScreen extends StatelessWidget {
  final Advert advert;

  IlanDetayScreen({required this.advert});

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyle(
        color: Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.6));
    const Divider(indent: 16.0, endIndent: 16.0);

    return Scaffold(
      appBar: AppBar(
        // title: Text(title),
        title: const Text('İlan Detayı'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(13.0),
        children: [
          ListTile(
            title: Text(
              'Kategori',
              style: titleStyle,
            ),
            trailing: Text(
              advert.category,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Satış Tipi',
              style: titleStyle,
            ),
            trailing: Text(
              advert.saleType,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'İlan Tarihi',
              style: titleStyle,
            ),
            trailing: Text(
              advert.date.toString(),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Fiyat',
              style: titleStyle,
            ),
            trailing: Text(
              advert.price.toString(),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Konum',
              style: titleStyle,
            ),
            trailing: Text(
              advert.location,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const Divider(),
          // ListTile(
          //   title: const Text('Durumu'),
          //   trailing: Icon(
          //     status == 'Güncel' ? Icons.check_circle : Icons.cancel,
          //     color: status == 'Güncel' ? Colors.green : Colors.red,
          //   ),
          // ),
          ListTile(
            title: Text(
              'Durumu',
              style: titleStyle,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize
                  .min, // Row'un içerik boyutuna göre genişlemesini sağlar.
              children: [
                Icon(
                  advert.status == 'Güncel' ? Icons.check_circle : Icons.cancel,
                  color: advert.status == 'Güncel' ? Colors.green : Colors.red,
                ),
                const SizedBox(
                    width: 4), // İkon ve metin arasında boşluk sağlar.
                Text(
                  advert
                      .status, // Burada 'Güncel' veya duruma göre farklı bir metin gösterilebilir.
                  style: TextStyle(
                    color:
                        advert.status == 'Güncel' ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Açıklama',
              style: titleStyle,
            ),
            subtitle: Text(
              advert.description,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Oluşturan Kullanıcı',
              style: titleStyle,
            ),
            subtitle: Text(
              "${advert.advertiser!.name} ${advert.advertiser!.lastName}",
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const Divider(),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SendMessageScreen(),
                ),
              );
            },
            child: const Text('Mesaj Gönder'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
