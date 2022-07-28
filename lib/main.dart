import 'package:flutter/material.dart';
import 'package:food/features/home/presentation/screen/home_page.dart';

import 'core/injections/config_dependencies.dart';

Future<void> main() async {
  // Initialize Dependency Injection.
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
