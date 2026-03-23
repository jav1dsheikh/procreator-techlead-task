import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'detail_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isLoading = true;
  List<dynamic> _services = [];

  @override
  void initState() {
    super.initState();
    _fetchServices();
  }

  Future<void> _fetchServices() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token') ?? '';

    try {
      final response = await http.get(
        Uri.parse('https://procreator-backend.onrender.com/services'),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        setState(() {
          _services = json.decode(response.body);
          _isLoading = false;
        });
      } else {
        print('Failed to load services: ${response.statusCode}');
        setState(() => _isLoading = false);
      }
    } catch (e) {
      print('Error fetching services: $e');
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _services.length,
              itemBuilder: (context, index) {
                final service = _services[index];
                return ListTile(
                  title: Text(
                    service['name'] ?? 'Unknown Service',
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    service['description'] ?? '',
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(service: service),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
