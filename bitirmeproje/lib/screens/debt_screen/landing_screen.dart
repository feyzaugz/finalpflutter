import 'package:bitirmeproje/hesapozeti.dart';
import 'package:bitirmeproje/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../home_screen/widgets/ayricaliklarım_section.dart';
import '../home_screen/widgets/ilan_panasu_section.dart';
import '../home_screen/widgets/user_info_debt_section.dart';

class LandingScreen extends ConsumerWidget {
  final String path;
  const LandingScreen({super.key, required this.path});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
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
          // Diğer BottomNavigationBarItem'lar eklenebilir
        ],
        currentIndex: findCurrentIndex(),
        selectedItemColor: Colors.blue,
        onTap: (v) {
          switch (v) {
            case 0:
              context.push("/");
              break;
            case 1:
              context.push(HesapOzetiScreen.routeName);
              break;
          }
        },
      ),
    );
  }

  int findCurrentIndex() {
    int index = 0;

    switch (path) {
      case "/":
        index = 0;
        break;

      case HesapOzetiScreen.routeName:
        index = 1;
        break;
    }
    return index;
  }

  buildBody() {
    switch (path) {
      case "/":
        return HomeScreen();

      case HesapOzetiScreen.routeName:
        return HesapOzetiScreen();

      default:
        return HomeScreen();
    }
  }
}
