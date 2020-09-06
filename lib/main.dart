import 'package:flutter/material.dart';
import 'package:mobxasync/features/_repo/user_repo.dart';

import 'package:mobxasync/features/users/home_screen.dart';
import 'package:mobxasync/features/users/_store/users_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [Provider(create: (_) => UsersStore(UserRepo()))],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobx + Async',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
