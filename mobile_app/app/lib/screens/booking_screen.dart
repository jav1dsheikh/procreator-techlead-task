import 'package:flutter/material.dart';
import '../services/api_service.dart';

class BookingScreen extends StatefulWidget {
  final String service;

  const BookingScreen({super.key, required this.service});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController nameController = TextEditingController();

  Future<void> createBooking() async {
    try {
      final response = await ApiService.post(
        "/bookings",
        {
          "service": widget.service,
          "user": nameController.text,
        },
      );

      if (response.statusCode == 200 && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Booking Created")),
        );
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to create booking")),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Session expired or unauthorized. Please login again.")),
        );
      }
    }
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
