import 'package:bitirmeproje/core/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'hesapozeti.dart';
import 'screens/Diger Ekran/diger_screen.dart';
import 'screens/Taleplerim Ekran/taleplerim.dart';

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
        primarySwatch: Colors.grey,
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
          MaterialPageRoute(builder: (context) => const HesapOzetiScreen()),
        );
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TaleplerimScreen()),
        );
      case 3:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DigerScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
