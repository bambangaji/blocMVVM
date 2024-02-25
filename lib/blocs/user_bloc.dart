import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_senbu/model/user.dart';

class UserBloc extends Bloc<String, User> {
  UserBloc() : super(User(id: '', name: ''));

  @override
  Stream<User> mapEventToState(String userId) async* {
    final user = User(id: userId, name: 'John Doe');

    yield user;
  }
}
