import 'package:flutter/material.dart';

import 'sqlite_connection.dart';

class SqliteAdmConnection with WidgetsBindingObserver {

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
  final connection = SqliteConnection();
    switch (state) {
      case AppLifecycleState.resumed:
        break;

      
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        connection.closeConnection();
        break;

        
    }

    super.didChangeAppLifecycleState(state);
  }
}
