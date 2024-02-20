import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey getKey() {
    return navigatorKey;
  }

  Future<dynamic>? navigateTo(String routeName) {
    return navigatorKey.currentState?.pushNamed(routeName);
  }


  void goBack() {
    return navigatorKey.currentState?.pop();
  }
}
