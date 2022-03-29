import 'package:flutter/material.dart';
import 'src/home/home_page.dart';

void main() async {
  runApp(MaterialApp(
    home: const Home(),
    theme: ThemeData(
      hintColor: Colors.green,
      primaryColor: Colors.white,
    ),
  ));
}
