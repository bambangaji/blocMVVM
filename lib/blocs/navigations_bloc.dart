// Define navigation events
import 'package:flutter/material.dart';
import 'package:merchant_senbu/screens/Dashboard/dashboard.dart';
import 'package:merchant_senbu/screens/Login/login.dart';
import 'package:merchant_senbu/screens/Login/register.dart';
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
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            return RegisterPage();
          },
        ),
      ],
    ),
  ],
);

void goToDashboard(BuildContext context) {
  return context.go('/dashboard');
}

void goToLogin(BuildContext context) {
  return context.go('/');
}

void goToNote(BuildContext context) {
  return context.go('/note');
}

void goToUser(BuildContext context) {
  return context.go('/user');
}

void goToRegister(BuildContext context) {
  return context.go('/register');
}
