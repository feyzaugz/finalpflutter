import 'package:flutter/material.dart';

import '../../debt_screen/debt_card.dart';
import 'kullanici_card.dart';

class UserInfoAndDebtSection extends StatelessWidget {
  const UserInfoAndDebtSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Kullanıcı bilgi kartı
        UserCard(),
        // Borç bilgi kartı
        DebtCard(),
      ],
    );
  }
}
