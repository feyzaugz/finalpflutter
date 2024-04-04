import 'package:flutter/material.dart';

class HesapOzetiScreen extends StatefulWidget {
  static const String routeName = "/hesap-ozeti";

  @override
  _HesapOzetiScreenState createState() => _HesapOzetiScreenState();
}

class _HesapOzetiScreenState extends State<HesapOzetiScreen> {
  int _selectedIndex = 1; // Hesap Özeti sekmesi varsayılan olarak seçili

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pop(context); // Eğer Ana Sayfa ise, önceki ekrana dön
    }
    // Hesap Özeti zaten görüntüleniyor, bu yüzden ekstra bir işlem yapmaya gerek yok.
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesap Özeti'),
        // AppBar stil ayarları yapılabilir
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              // Kalender ikonunu kullan
              child: Icon(Icons.event, size: 100, color: Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                    child: Text('Sonra Karar Ver'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Evet, isterim butonu işlevi
                    },
                    child: Text('Evet, İsterim'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      // primary: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            NoDebtInfoSection(),
            MyCardsSection(),
            AccountGraphSection(),
            // Diğer widget'lar buraya eklenebilir.
          ],
        ),
      ),
    );
  }
}

class NoDebtInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.celebration, size: 48, color: Colors.orange),
        Text('Borçunuz Bulunmuyor'),
        OutlinedButton(
          onPressed: () {
            // Hesap Özeti İnceleme işlevi
          },
          child: Text('Hesap Özetini İncele'),
        ),
      ],
    );
  }
}

class MyCardsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.credit_card, size: 48, color: Colors.blue),
          title: Text('Kayıtlı Kartınız Bulunmuyor!'),
          trailing: OutlinedButton(
            onPressed: () {
              // Kart ekleme işlevi
            },
            child: Text('Kart Ekle'),
          ),
        ),
        TextButton(
          onPressed: () {
            // Pasif Kartları Görüntüle işlevi
          },
          child: Text('Pasif Kartları Görüntüle'),
        ),
      ],
    );
  }
}

class AccountGraphSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hesap Grafiği',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              TextButton(
                onPressed: () {
                  // Genel görünüm işlevi
                },
                child: Text('Genel'),
              ),
            ],
          ),
        ),
        Container(
          height: 200.0, // Grafik yüksekliği
          color: Colors.blue[100], // Grafik arka plan rengi
          child: Center(
            child: Text('Grafik alanı'), // Grafik burada yer alacak
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Hesap Özeti İşlevi
                },
                icon: Icon(Icons.search),
                label: Text('Hesap Özeti'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue[200],
                  // primary: Colors.blue[200],
                  shape: StadiumBorder(),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Ödeme Yap İşlevi
                },
                icon: Icon(Icons.payment),
                label: Text('Ödeme Yap'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  //     primary: Colors.blue,
                  // onPrimary: Colors.white,
                  shape: StadiumBorder(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
