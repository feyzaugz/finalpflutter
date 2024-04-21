import 'package:bitirmeproje/core/global_providers/auth_state_provider.dart';
import 'package:bitirmeproje/core/global_providers/user_state_provider.dart';
import 'package:bitirmeproje/core/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserCard extends ConsumerWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStateProvider);

    if (user == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (user.name.isNotEmpty && user.lastName.isNotEmpty)
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30.0,
              child: Text(
                "${user.name.characters.first} ${user.lastName.characters.first}",
              ),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "${user.name} ${user.lastName}",
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Bildirimler sayfasına yönlendir
            },
          ),
        ],
      ),
    );
  }
}
