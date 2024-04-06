import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

abstract class Connection {
  static final _status = ValueNotifier<ConnectivityResult>(
    ConnectivityResult.none,
  );

  static ConnectivityResult get status => _status.value;
  static ValueNotifier<ConnectivityResult> get statusListenable => _status;

  static Future<void> setup() async {
    _status.value =
        (await Connectivity().checkConnectivity()) as ConnectivityResult;

    Connectivity().onConnectivityChanged.listen((event) {
      _status.value = event as ConnectivityResult;
    });
  }
}

extension ConnectivityResultX on ConnectivityResult {
  bool get availableForPhones =>
      this == ConnectivityResult.mobile || this == ConnectivityResult.wifi;
}

mixin ConnectivityListener<T extends StatefulWidget> on State<T> {
  void _onChanged() {
    onConnectivityChanged(Connection._status.value);
  }

  @override
  void initState() {
    Connection._status.addListener(_onChanged);
    super.initState();
  }

  @override
  void dispose() {
    Connection._status.removeListener(_onChanged);
    super.dispose();
  }

  void onConnectivityChanged(ConnectivityResult cs);
}
