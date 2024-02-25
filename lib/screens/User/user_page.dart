import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_senbu/blocs/user_bloc.dart';
import 'package:merchant_senbu/model/user.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = Provider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'User ID:',
            ),
            BlocBuilder<UserBloc, User>(
              builder: (context, user) {
                return Text(
                  user.id,
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                userBloc.add(
                  '1',
                ); // Trigger an event to fetch user with ID '1'
              },
              child: Text('Fetch User'),
            ),
          ],
        ),
      ),
    );
  }
}
