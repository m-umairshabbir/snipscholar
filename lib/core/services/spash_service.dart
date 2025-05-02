import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snipscholar/core/Config/route/route_names.dart';

class SplashService {
  void isLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    if (!context.mounted) return;
    final prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.testScreen,
        (routes) => false,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.signInScreen,
        (routes) => false,
      );
    }
  }
}
