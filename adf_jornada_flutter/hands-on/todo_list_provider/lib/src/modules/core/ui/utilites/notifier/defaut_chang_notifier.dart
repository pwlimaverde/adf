import 'package:flutter/material.dart';

base class DefautChangNotifier extends ChangeNotifier {
  bool _loading = false;
  String? _error;
  bool _success = false;

  bool get loading => _loading;
  String? get error => _error;
  bool get hasError => _error != null;
  bool get isSuccess => _success;

  void showLoading() {
    _loading = true;
    _resetStatus();
    notifyListeners();
  }

  void hideLoading() {
    _loading = false;
    notifyListeners();
  }

  void success() => _success = true;

  void setError(String? error) => _error = error;

  void _resetStatus() {
    _error = null;
    _success = false;
  }
}
