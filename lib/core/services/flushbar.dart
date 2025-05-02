import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static void showFlushNotification(
      BuildContext context, String message, IconData icon, Color color) {
    Future.delayed(const Duration(milliseconds: 500), () {
      Flushbar(
        message: message,
        icon: Icon(
          icon,
          size: 28.0,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        borderRadius: BorderRadius.circular(8),
        backgroundColor: color,
        flushbarPosition: FlushbarPosition.TOP,
      ).show(context);
    });
  }
}
