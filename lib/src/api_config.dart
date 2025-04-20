// lib/src/api_config.dart

import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

/// Configuración de la URL base para la API según plataforma.
class ApiConfig {
  /// Dirección IP de tu máquina en la red local (para iOS device real).
  static const _localIp = '192.168.1.42';

  /// Puerto donde corre tu servidor Node/Express.
  static const _port = '4000';

  static String get baseUrl {
    if (kIsWeb) {
      // En producción deberías apuntar a tu dominio/HTTPS
      return 'https://tu-dominio.cl';
    }
    if (Platform.isAndroid) {
      // Emulador Android: 10.0.2.2 ↔ localhost de la máquina host
      return 'http://10.0.2.2:$_port';
    }
    if (Platform.isIOS) {
      // Simulador iOS: localhost funciona igual que web
      // Dispositivo real iOS: usa la IP de tu máquina (asegúrate que estén en la misma red WiFi)
      return 'http://$_localIp:$_port';
    }
    // Otros (desktop, etc.)
    return 'http://localhost:$_port';
  }
}
