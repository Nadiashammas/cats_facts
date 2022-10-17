import 'package:cats_facts/remote_services/remote_services.dart';
import 'package:cats_facts/screens/home.dart';
import 'package:flutter/material.dart';

import 'model/cates.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
