// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:merchant_senbu/blocs/loading_bloc.dart';

import 'package:merchant_senbu/blocs/navigations_bloc.dart';

void main() async {
  String fileName = '.env';
  await dotenv.load(fileName: fileName);
  runApp(MyApp());
}

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoadingBloc(),
        child: MaterialApp.router(
          routerConfig: routerPage,
        ));
  }
}
