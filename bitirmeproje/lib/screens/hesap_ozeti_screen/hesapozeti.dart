import 'package:bitirmeproje/core/global_providers/user_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'kart_ekle.dart';

class HesapOzetiScreen extends ConsumerStatefulWidget {
  static const String routeName = "/hesap-ozeti";

  const HesapOzetiScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HesapOzetiScreenState();
}

class _HesapOzetiScreenState extends ConsumerState<HesapOzetiScreen> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hesap Özeti'),
        centerTitle: true,
        // AppBar stil ayarları yapılabilir
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(16.0),
              // Kalender ikonunu kullan
              child: Icon(Icons.event, size: 100, color: Colors.blue),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Son ödeme tarihi yaklaşan ödemelerinizi hatırlatmamızı ister misiniz?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Sonra karar ver butonu işlevi
                    },
                    child: const Text('Sonra Karar Ver'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Evet, isterim butonu işlevi
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      // primary: Colors.blue,
                    ),
                    child: const Text('Evet, İsterim'),
                  ),
                ],
              ),
            ),
            if (user!.debt == 0) const NoDebtInfoSection(),
            const MyCardsSection(),
            AccountGraphSection(),
            // Diğer widget'lar buraya eklenebilir.
          ],
        ),
      ),
    );
  }
}

class NoDebtInfoSection extends StatelessWidget {
  const NoDebtInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(50.0),
      child: Column(
        children: [
          Icon(Icons.celebration, size: 48, color: Colors.orange),
          Text('Borcunuz Bulunmuyor'),
          // OutlinedButton(
          //   onPressed: () {
          //     // Hesap Özeti İnceleme işlevi
          //   },
          //   child: const Text('Hesap Özetini İncele'),
          // ),
        ],
      ),
    );
  }
}

class MyCardsSection extends StatelessWidget {
  const MyCardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(5.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.credit_card, size: 48, color: Colors.blue),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text('Kayıtlı Kartınız Bulunmuyor!'),
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Kart ekleme sayfasına yönlendir
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCardScreen()),
                    );
                  },
                  child: const Text('Kart Ekle'),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                // Pasif Kartları Görüntüle işlevi
              },
              child: const Text('Pasif Kartları Görüntüle'),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountGraphSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(
              //   'Hesap Grafiği',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              // ),
              // TextButton(
              //   onPressed: () {
              //     // Genel görünüm işlevi
              //   },
              //   child: Text('Genel'),
              // ),
            ],
          ),
          // Container(
          //   height: 200.0, // Grafik yüksekliği
          //   color: Colors.blue[100], // Grafik arka plan rengi
          //   child: Center(
          //     child: Text('Grafik alanı'), // Grafik burada yer alacak
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // ElevatedButton.icon(
              //   onPressed: () {
              //     // Hesap Özeti İşlevi
              //   },
              //   icon: Icon(Icons.search),
              //   label: Text('Hesap Özeti'),
              //   style: ElevatedButton.styleFrom(
              //     foregroundColor: Colors.blue[200],
              //     shape: StadiumBorder(),
              //   ),
              // ),
              ElevatedButton.icon(
                onPressed: () {
                  // Ödeme Yap İşlevi
                },
                icon: const Icon(Icons.payment),
                label: const Text('Ödeme Yap'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}