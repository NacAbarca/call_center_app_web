// lib/src/services/api_service.dart

import 'package:http/http.dart' as http;
import '../api_config.dart';
import 'dart:convert';

class ApiService {
  /// Comprueba la salud del backend.
  Future<bool> ping() async {
    final url = Uri.parse('${ApiConfig.baseUrl}/api/health');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['status'] == 'OK';
    }
    return false;
  }

  // Aquí puedes añadir más métodos, p. ej. login, purchaseCoins(), startCall(), etc.
}
