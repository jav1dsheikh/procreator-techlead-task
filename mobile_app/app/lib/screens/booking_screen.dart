import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookingScreen extends StatefulWidget {
  final String service;

  const BookingScreen({super.key, required this.service});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController nameController = TextEditingController();

  Future<void> createBooking() async {
    await http.post(
      Uri.parse("http://10.0.2.2:3000/bookings"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "service": widget.service,
        "user": nameController.text,
      }),
    );

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Booking Created")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Booking")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Service: ${widget.service}"),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Your Name"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: createBooking,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
