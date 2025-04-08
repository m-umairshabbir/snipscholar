import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:snipscholar/core/Config/colors/colors.dart';
import 'package:snipscholar/core/services/spash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _splashService = SplashService();
  @override
  void initState() {
    // TODO: implement initState
    _splashService.isLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'images/logo.png',
          color: AppColors.teal,
          width: screenWidth * .5,
          height: screenHeight * .3,
          fit: BoxFit.contain,
        ),
        const SpinKitPulse(
          color: AppColors.teal,
          size: 30,
        ),
        const SizedBox(height: 40),
      ],
    )));
  }
}
