// lib/main.dart  (o lib/mil.dart si usas ese entrypoint)

import 'package:call_center_appweb/src/pages/call_page.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/call': (context) => const CallPage(),

      },
      
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _isUp ? 'Backend OK 🎉' : 'Conectando al backend…',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 24),
            
            ElevatedButton.icon(
              icon: const Icon(Icons.video_call),
              label: const Text("Iniciar Videollamada"),
              onPressed: () => Navigator.pushNamed(context, '/call'),
            ),
          ],
        ),
      ),
    );
  }
}