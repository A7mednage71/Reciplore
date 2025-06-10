import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetChecker {
  static final InternetChecker _instance = InternetChecker._();

  factory InternetChecker() => _instance;

  InternetChecker._();

  StreamSubscription<InternetStatus>? _subscription;

  final StreamController<bool> _connectionController =
      StreamController<bool>.broadcast();

  Stream<bool> get onConnectionChange => _connectionController.stream;

  Future<void> initialize() async {
    _subscription =
        InternetConnection().onStatusChange.listen((InternetStatus status) {
      _connectionController.add(status == InternetStatus.connected);
    });
  }

  Future<bool> checkConnection() async {
    return await InternetConnection().hasInternetAccess;
  }

  void dispose() {
    _subscription?.cancel();
    _connectionController.close();
  }
}
