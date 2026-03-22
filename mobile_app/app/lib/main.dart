import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service Booking',
      home: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: const Center(child: Text('Login Screen')),
      ),
    );
  }
}
