import 'package:flutter/material.dart';

import 'constant.dart';
import 'views/home.dart';

void main() => runApp(Kmart());

class Kmart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kmart',
      theme: ThemeData(primarySwatch: white),
      home: const Home(),
    );
  }
}
