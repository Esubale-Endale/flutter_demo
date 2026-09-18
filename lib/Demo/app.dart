import 'package:flutter/material.dart';

import 'HomePage.dart';

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const DemoHomePage(title: 'Flutter Demo'),
    );
  }
}
