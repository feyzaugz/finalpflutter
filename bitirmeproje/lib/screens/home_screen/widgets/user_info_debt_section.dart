import 'package:flutter/material.dart';

import 'debt_card.dart';
import 'user_card.dart';

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
