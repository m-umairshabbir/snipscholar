import 'package:flutter/material.dart';
import 'package:snipscholar/core/presentation/screens/landingPage/homeScreen/desktop/desktop_view.dart';
import 'package:snipscholar/core/presentation/screens/landingPage/homeScreen/mobile/mobile_view.dart';


class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          return DesktopView();
        } else {
          return MobileView();
        }
      },
    );
  }
}