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

import 'package:bitirmeproje/core/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'hesapozeti.dart'; // Hesap Özeti ekranı için dosya

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Borç Ödeme Ekranı',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: ref.read(goRouterProvider),
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
              // UserInfoAndDebtSection(),
              // IlanPanosuSection(),
              // AyricaliklarimSection(),
              // DuyurularSection(),
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

// class BottomNavigationBarSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Ana Sayfa',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.receipt_long),
//           label: 'Hesap Özeti',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.assignment),
//           label: 'Taleplerim',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person_outline),
//           label: 'Size Özel',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.more_horiz),
//           label: 'Diğer',
//         ),
//       ],
//     );
//   }
// }
