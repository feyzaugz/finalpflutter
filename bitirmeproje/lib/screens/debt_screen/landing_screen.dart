import 'package:bitirmeproje/hesapozeti.dart';
import 'package:bitirmeproje/screens/home_screen/home_screen.dart';
import 'package:bitirmeproje/screens/Diger%20Ekran/diger_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../Taleplerim Ekran/taleplerim.dart';

class LandingScreen extends ConsumerWidget {
  final String path;
  const LandingScreen({super.key, required this.path});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Taleplerim',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_rounded),
            label: 'Diğer',
          ),
        ],
        currentIndex: findCurrentIndex(),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go("/");
              break;
            case 1:
              context.go(HesapOzetiScreen.routeName);
              break;
            case 2:
              context.go(
                  TaleplerimScreen.routeName); // Taleplerim sayfasına yönlendir
            case 3:
              context.go(
                  DigerScreen.routeName); // Taleplerim sayfasına yönlendir

              break;
          }
        },
      ),
    );
  }

  int findCurrentIndex() {
    switch (path) {
      case "/":
        return 0;
      case HesapOzetiScreen.routeName:
        return 1;
      case TaleplerimScreen.routeName:
        return 2;
      case DigerScreen.routeName:
        return 3;
      default:
        return 0; // Ana Sayfa varsayılan olarak döner
    }
  }

  buildBody() {
    switch (path) {
      case "/":
        return const HomeScreen();
      case HesapOzetiScreen.routeName:
        return const HesapOzetiScreen();
      case TaleplerimScreen.routeName:
        return const TaleplerimScreen(); // Taleplerim sayfası
      case DigerScreen.routeName:
        return const DigerScreen(); //Diger sayfası
      default:
        return const HomeScreen(); // Varsayılan olarak ana sayfa
    }
  }
}
// import 'package:flutter/material.dart';

// class PaymentScreen extends StatefulWidget {
//   @override
//   State<PaymentScreen> createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//     int _currentStep = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ödeme'),
//         centerTitle: true,
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.info_outline),
//             onPressed: () {
//               // Bilgi iconunun işlevi
//             },
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           Stepper(
//             currentStep: 0, // Mevcut adım
//             steps: [
//               Step(
//                 title: const Text('Özet'),
//                 content: Container(), // Buraya ilk adım içeriği gelecek
//                 isActive: true,
//               ),
//               Step(
//                 title: const Text('Ödeme Bilgileri'),
//                 content: Container(), // Buraya ikinci adım içeriği gelecek
//                 isActive: false,
//               ),
//               Step(
//                 title: const Text('Onay'),
//                 content: Container(), // Buraya üçüncü adım içeriği gelecek
//                 isActive: false,
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Card(
//               child: ListTile(
//                 title: Text(
//                     'TEKNİK YAPI METROPARK 1386 /1 PARSEL TOPLU YAPILAR - Feyza Uğuz'),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Card(
//               child: Column(
//                 children: [
//                   ListTile(
//                     title: const Text('Ödeme Bilgileri'),
//                     subtitle: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Checkbox(
//                               value: true, // Checkbox durumu
//                               onChanged: (bool? value) {
//                                 // Checkbox işlevi
//                               },
//                             ),
//                             const Expanded(child: Text('C4-45')),
//                             Text('0,00 TL'), // Örnek bir tutar
//                           ],
//                         ),
//                         // Diğer borç ve ödeme bilgileri...
//                       ],
//                     ),
//                   ),
//                   const Divider(height: 1),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: const [
//                         Text('Toplam'),
//                         Text('0,00 TL'), // Örnek bir toplam tutar
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Devam et butonunun işlevi
//               },
//               child: const Text('Devam Et'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }