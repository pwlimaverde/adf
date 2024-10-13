import 'package:flutter/material.dart';

base class DefautChangNotifier extends ChangeNotifier {
  bool _loading = false;
  String? _error;
  String? _success;
  String? _info;

  bool get loading => _loading;
  String? get error => _error;
  String? get info => _info;
  String? get success => _success;
  bool get hasError => _error != null;
  bool get hasInfo => _info != null;
  bool get isSuccess => _success != null;

  void showLoading() {
    _loading = true;
    _resetStatus();
    notifyListeners();
  }

  void hideLoading() {
    _loading = false;
    notifyListeners();
  }

  void setSuccess(String? message) => _success = message;

  void setError(String? message) => _error = message;

  void setInfo(String? message) => _info = message;

  void _resetStatus() {
    _error = null;
    _success = null;
    _info = null;
  }
}
