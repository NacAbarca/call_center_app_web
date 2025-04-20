// lib/src/api_config.dart

import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class ApiConfig {
  static const _port = '4000';

  static String get baseUrl {
    if (kIsWeb) {
      // Desarrollo web local
      return 'http://localhost:$_port';
    }
    if (Platform.isAndroid) {
      // Emulador Android ↔ localhost de tu máquina
      return 'http://10.0.2.2:$_port';
    }
    // macOS u otros desktop
    return 'http://localhost:$_port';
  }
}
