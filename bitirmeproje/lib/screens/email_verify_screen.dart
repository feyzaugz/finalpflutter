import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/global_providers/auth_state_provider.dart';

class EmailVerifyScreen extends ConsumerWidget {
  static String routeName = "/verify-email";

  const EmailVerifyScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    print(ref.watch(authStateProvider));
    return EmailVerificationScreen(
      sideBuilder: (context, constraints) => buildBrand(context),
      headerBuilder: (context, constraints, _) => buildBrand(context),
      actions: [
        EmailVerifiedAction(() {
          ref.read(authStateProvider.notifier).getUser();

          context.push("/");
        })
      ],
    );
  }

  Widget buildBrand(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer(builder: (context, ref, _) {
          return Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  ref.read(authStateProvider.notifier).signOut();
                },
                icon: const Icon(Icons.exit_to_app)),
          );
        }),
        const Icon(
          Icons.shop,
          size: 72,
        ),
        Text('Wholesale', style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
