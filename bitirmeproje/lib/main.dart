// import 'package:flutter/material.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Borç Ödeme Ekranı',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: DebtScreen(),
//     );
//   }
// }

// class DebtScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlueAccent,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               UserInfoAndDebtSection(),
//               IlanPanosuSection(),
//               AyricaliklarimSection(),
//               DuyurularSection(),
//               // İhtiyaca göre daha fazla bölüm eklenebilir
//             ],
//           ),
//         ),
        
//       ),
//       bottomNavigationBar: BottomNavigationBarSection(), // Alt menüyü ekleyin

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'hesapozeti.dart'; // Hesap Özeti ekranı için dosya

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Borç Ödeme Ekranı',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DebtScreen(),
    );
  }
}

class DebtScreen extends StatefulWidget {
  @override
  _DebtScreenState createState() => _DebtScreenState();
}

class _DebtScreenState extends State<DebtScreen> {
  int _selectedIndex = 1; // Varsayılan olarak Hesap Özeti ekranını göster

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 1: // Hesap Özeti ekranının indexi
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HesapOzetiScreen()),
        );
        break;
      // Diğer indeksler için Navigator.push eklenebilir
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              UserInfoAndDebtSection(),
              IlanPanosuSection(),
              AyricaliklarimSection(),
              DuyurularSection(),
              // İhtiyaca göre daha fazla bölüm eklenebilir
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Hesap Özeti',
          ),
          // Diğer BottomNavigationBarItem'lar eklenebilir
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class UserInfoAndDebtSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Kullanıcı bilgi kartı
        UserCard(),
        // Borç bilgi kartı
        DebtCard(),
      ],
    );
  }
}

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30.0,
            child: Text('HC'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Feyza Uğuz\nAnkara',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Bildirimler sayfasına yönlendir
            },
          ),
        ],
      ),
    );
  }
}

class DebtCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        title: Text('Borcunuz'),
        subtitle: Text('2.560,21 TL', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0)),
        trailing: ElevatedButton(
          onPressed: () {
            // Ödeme yapma işlevi
          },
          child: Text('Ödeme Yap'),
          style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
        ),
      ),
    );
  }
}

class IlanPanosuSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'İlan Panosu',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          IlanCard(title: 'Badanacı', icon: Icons.brush),
          IlanCard(title: 'ÖZEL DERS / Yüzme, Matematik, İngilizce', icon: Icons.school),
          IlanCard(title: 'Mobil Oyun, Üretkenlik ve Hobi', icon: Icons.gamepad),
          // Daha fazla ilan card eklenebilir
          TextButton(
            onPressed: () {
              // Tüm ilanları gösterme işlevi
            },
            child: Text(
              'TÜMÜ',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton.icon(
            onPressed: () {
              // İlan ekleme işlevi
            },
            icon: Icon(Icons.add),
            label: Text('Oluştur'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              onPrimary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class IlanCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const IlanCard({Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.0),
      child: ListTile(
                leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title),
        trailing: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            // İlanı kaldırma işlevi
          },
        ),
      ),
    );
  }
}

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
              childAspectRatio: 1 / 1, // Kare şeklinde kartlar için aspect ratio
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

class AyricalikCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;
  final String imagePath;

  const AyricalikCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.iconData,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Kart içindeki içeriği genişlet
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Image.asset(
              '',
              fit: BoxFit.cover, // Resmi kaplayacak şekilde ayarla
            ),
          ),
          ListTile(
            leading: Icon(iconData, size: 20),
            title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(subtitle),
          ),
        ],
      ),
    );
  }
}
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
class BottomNavigationBarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Ana Sayfa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long),
          label: 'Hesap Özeti',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Taleplerim',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Size Özel',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: 'Diğer',
        ),
      ],
    );
  }
}
