import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class CustomFlushBar {
  static showCustomFlushBar({
    required BuildContext context,
    required String message,
    required Icon icon,
    required Color backgroundColor,
    required Duration duration,
  }) {
    Flushbar(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      borderRadius: BorderRadius.circular(20),
      backgroundColor: backgroundColor.withOpacity(0.9),
      boxShadows: const [
        BoxShadow(
          color: Colors.black26,
          offset: Offset(0, 4),
          blurRadius: 10,
        ),
      ],
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: const Duration(milliseconds: 500),
      forwardAnimationCurve: Curves.easeOutExpo,
      reverseAnimationCurve: Curves.easeInExpo,
      icon: icon,

      shouldIconPulse: false,
      messageText: Text(
        message,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.white,
          letterSpacing: 0.3,
        ),
      ),
      duration: duration,
    ).show(context);
  }
}
