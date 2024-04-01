import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/sign-in";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: [EmailAuthProvider()],
      showAuthActionSwitch: true,
      sideBuilder: (context, constraints) => buildSideBar(context),
      headerBuilder: (context, constraints, _) => buildHeader(context),
    );
  }

  buildSideBar(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [],
    );
  }

  buildHeader(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [],
    );
  }
}
