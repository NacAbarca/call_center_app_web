// lib/main.dart  (o lib/mil.dart si usas ese entrypoint)

import 'package:flutter/material.dart';
import 'src/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Center AppWeb',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _api = ApiService();
  bool _isUp = false;

  @override
  void initState() {
    super.initState();
    _checkBackend();
  }

  Future<void> _checkBackend() async {
    final ok = await _api.ping();
    setState(() => _isUp = ok);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Call Center AppWeb')),
      body: Center(
        child: Text(
          _isUp ? 'Backend OK 🎉' : 'Conectando al backend…',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
