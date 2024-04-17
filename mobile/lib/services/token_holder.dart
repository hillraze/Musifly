import 'package:flutter/material.dart';

import '../utils/crypto_storage.dart';

abstract class Tokens {
  static bool get hasToken => _token.value != null;

  static String get token {
    assert(hasToken);
    return _token.value!;
  }

  static final _token = ValueNotifier<String?>(null);

  static void initToken() {
    final token = Storage.get('token');
    if (token != null) {
      _token.value = token;
    }
  }

  static Future<void> setToken(String token) async {
    await Storage.put('token', token);

    _token.value = token;
  }

  static Future<void> removeToken() async {
    await Storage.remove('token');

    _token.value = null;
  }
}
