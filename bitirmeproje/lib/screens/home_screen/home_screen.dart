import 'package:flutter/material.dart';
import 'widgets/ayricaliklar/ayricaliklarim_section.dart';
import 'widgets/duyurular/duyurular_section.dart';
import 'widgets/İlan/ilan_panosu_section.dart';
import 'widgets/user_info_debt_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserInfoAndDebtSection(),
            IlanPanosuSection(),
            AyricaliklarimSection(),
            DuyurularSection(),
          ],
        ),
      ),
    );
  }
}
