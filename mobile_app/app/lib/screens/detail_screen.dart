import 'package:flutter/material.dart';
import 'booking_screen.dart';

class DetailScreen extends StatelessWidget {
  final dynamic service;

  const DetailScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final serviceName = service['name'] ?? 'Unknown Service';
    final serviceDescription =
        service['description'] ?? 'No description available';

    return Scaffold(
      appBar: AppBar(title: Text(serviceName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              serviceName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              serviceDescription,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingScreen(serviceName: serviceName),
                    ),
                  );
                },
                child: const Text('Book Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
