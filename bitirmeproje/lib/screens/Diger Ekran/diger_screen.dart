import 'package:bitirmeproje/screens/Diger%20Ekran/telefon_rehberi.dart';
import 'package:bitirmeproje/screens/guests_screen/guests_screen.dart';
import 'package:bitirmeproje/screens/home_screen/widgets/duyurular/duyurular_tumu.dart';
import 'package:bitirmeproje/screens/home_screen/widgets/kullanici_card.dart';
import 'package:flutter/material.dart';

import 'rezervasyon.dart';

class DigerScreen extends StatefulWidget {
  static const String routeName = "/diger-screen";
  const DigerScreen({Key? key}) : super(key: key);

  @override
  State<DigerScreen> createState() => _DigerScreenState();
}

class _DigerScreenState extends State<DigerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const UserCard(),
          ListTile(
            leading: const Icon(Icons.announcement, color: Colors.blue),
            title: const Text("Duyurular"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DuyurularScreen()),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.money, color: Colors.green),
          //   title: const Text("Kira"),
          //   onTap: () {
          //     // Kira bilgileri sayfasına yönlendirme
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.calendar_today, color: Colors.red),
            title: const Text("Rezervasyon"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RezervasyonScreen(),
                ),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.insert_chart, color: Colors.orange),
          //   title: const Text("Raporlar"),
          //   onTap: () {
          //     // Raporlar sayfasına yönlendirme
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.local_shipping, color: Colors.purple),
          //   title: const Text("Gönderi Takibi"),
          //   onTap: () {
          //     // Gönderi takip sayfasına yönlendirme
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.phone, color: Colors.brown),
            title: const Text("Telefon Rehberi"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TelefonRehberiScreen(),
                ),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.poll, color: Colors.teal),
          //   title: const Text("Anket"),
          //   onTap: () {
          //     // Anket sayfasına yönlendirme
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.people, color: Colors.cyan),
            title: const Text("Ziyaretçi Kaydı"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ZiyaretciKaydiScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
