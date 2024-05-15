import 'package:flutter/material.dart';
import 'widgets/Ayrıcalıklar/ayricaliklarım_section.dart';
import 'widgets/duyurular/duyurular_section.dart';
import 'widgets/İlan/ilan_panosu_section.dart';
import 'widgets/user_info_debt_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserInfoAndDebtSection(),
            const IlanPanosuSection(),
            const AyricaliklarimSection(),
            const DuyurularSection(),
          ],
        ),
      ),
    );
  }
}
