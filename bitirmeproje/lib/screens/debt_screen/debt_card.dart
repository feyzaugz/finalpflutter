import 'package:bitirmeproje/core/global_providers/user_state_provider.dart';
import 'package:bitirmeproje/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home_screen/widgets/odeme_ekrani.dart';

class DebtCard extends ConsumerWidget {
  const DebtCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStateProvider);
    if (user == null) return const SizedBox.shrink();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        title: const Text('Borcunuz'),
        subtitle: Text(Utils.currencyFormat(user.debt),
            style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0)),
        trailing: user.debt > 0
            ? ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blueAccent,
                  // primary: Colors.blueAccent
                ),
                child: const Text('Ödeme Yap'),
              )
            : null,
      ),
    );
  }
}
