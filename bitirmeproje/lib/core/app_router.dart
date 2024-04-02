import 'package:bitirmeproje/hesapozeti.dart';
import 'package:bitirmeproje/screens/email_verify_screen.dart';
import 'package:bitirmeproje/screens/debt_screen/landing_screen.dart';
import 'package:bitirmeproje/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'global_providers/auth_state_provider.dart';

final GlobalKey<NavigatorState> rootNavigator =
    GlobalKey<NavigatorState>(debugLabel: 'Main Navigator');
final GlobalKey<NavigatorState> shellNavigator =
    GlobalKey<NavigatorState>(debugLabel: 'Shell Navigator');

final goRouterProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
      refreshListenable: router,
      routes: router._routes,
      navigatorKey: rootNavigator,
      initialLocation: '/');
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  User? user;

  RouterNotifier(this._ref) {
    _ref.listen<User?>(
      authStateProvider,
      (previus, next) {
        user = next;

        notifyListeners();
      },
    );
  }

  List<RouteBase> get _routes => [
        GoRoute(
          path: LoginScreen.routeName,
          parentNavigatorKey: rootNavigator,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
          redirect: (context, state) {
            if (user == null) {
              return null;
            } else {
              if (user!.emailVerified) {
                return "/";
              } else {
                return EmailVerifyScreen.routeName;
              }
            }
          },
        ),
        GoRoute(
          path: EmailVerifyScreen.routeName,
          parentNavigatorKey: rootNavigator,
          builder: (BuildContext context, GoRouterState state) {
            return const EmailVerifyScreen();
          },
          redirect: (context, state) {
            if (user == null) {
              return LoginScreen.routeName;
            } else {
              if (user!.emailVerified) {
                return "/";
              } else {
                return null;
              }
            }
          },
        ),
        ShellRoute(
          navigatorKey: shellNavigator,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return LandingScreen(path: state.fullPath.toString());
          },
          routes: [
            GoRoute(
              path: '/',
              parentNavigatorKey: shellNavigator,
              builder: (BuildContext context, GoRouterState state) {
                return LandingScreen(path: state.path.toString());
              },
              redirect: (context, state) {
                if (user == null) {
                  return LoginScreen.routeName;
                } else {
                  if (!user!.emailVerified) {
                    return EmailVerifyScreen.routeName;
                  } else {
                    return null;
                  }
                }
              },
            ),
            GoRoute(
              path: HesapOzetiScreen.routeName,
              parentNavigatorKey: shellNavigator,
              builder: (BuildContext context, GoRouterState state) {
                return LandingScreen(path: state.path.toString());
              },
              redirect: (context, state) {
                if (user == null) {
                  return LoginScreen.routeName;
                } else {
                  if (!user!.emailVerified) {
                    return EmailVerifyScreen.routeName;
                  } else {
                    return null;
                  }
                }
              },
            ),
          ],
        ),
      ];
}
