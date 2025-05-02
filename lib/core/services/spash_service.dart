import 'dart:async';
import 'package:flutter/material.dart';
import 'package:snipscholar/core/Config/route/route_names.dart';

class SplashService {
  void isLogin(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.signInScreen,
        (routes) => false,
      );

  }
}
