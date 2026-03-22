import 'package:flutter/material.dart';
import 'booking_screen.dart';

class DetailScreen extends StatelessWidget {
  final String service;

  const DetailScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(service)),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BookingScreen(service: service),
              ),
            );
          },
          child: const Text("Book Now"),
        ),
      ),
    );
  }
}
