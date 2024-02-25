// login_page.dart
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:merchant_senbu/blocs/navigations_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => RoutingPage.goToNote(context),
          child: const Text('Go to the Details screen'),
        ),
      ),
    );
  }
}
