import 'package:flutter/material.dart';

import 'widgets/ayricaliklarım_section.dart';
import 'widgets/ilan_panasu_section.dart';
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
            IlanPanosuSection(),
            AyricaliklarimSection(),
            // DuyurularSection(),
            // İhtiyaca göre daha fazla bölüm eklenebilir
          ],
        ),
      ),
    );
  }
}
