import 'package:flutter/material.dart';

import '../../debt_screen/debt_card.dart';
import 'kullanici_card.dart';

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
