// Define navigation events
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_senbu/screens/Dashboard/dashboard.dart';
import 'package:merchant_senbu/screens/Login/login.dart';
import 'package:merchant_senbu/screens/Note/note.dart';
import 'package:merchant_senbu/screens/User/user_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter routerPage = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'dashboard',
          builder: (BuildContext context, GoRouterState state) {
            return DashboardPage();
          },
        ),
        GoRoute(
          path: 'note',
          builder: (BuildContext context, GoRouterState state) {
            return NoteListViewPage();
          },
        ),
        GoRoute(
          path: 'user',
          builder: (BuildContext context, GoRouterState state) {
            return UserPage();
          },
        ),
      ],
    ),
  ],
);

class RoutingPage {
  static void goToDashboard(BuildContext context) {
    return context.go('/dashboard');
  }

  static void goToNote(BuildContext context) {
    return context.go('/note');
  }

  static void goToUser(BuildContext context) {
    return context.go('/user');
  }
}
