import 'package:flutter/cupertino.dart';

class AppCoordinator with WidgetsBindingObserver {
  ///Singleton
  static AppCoordinator shared = AppCoordinator._();

  AppCoordinator._();

  Future<bool> init(BuildContext context) async {
    /// For initialization of global variables
    return true;
  }
}
