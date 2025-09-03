import 'package:flutter/material.dart';
import 'package:my_note_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

// Root Aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
    );
  }
}
