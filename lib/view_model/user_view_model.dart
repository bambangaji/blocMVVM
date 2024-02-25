import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  final String userId;

  const UserView({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: Text('User ID: $userId'),
      ),
    );
  }
}
