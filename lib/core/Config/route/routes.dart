import 'package:flutter/material.dart';
import 'package:snipscholar/core/Config/route/route_names.dart';
import 'package:snipscholar/core/presentation/screens/authenticaion/signin/signin.dart';
import 'package:snipscholar/core/presentation/screens/landingPage/landing_screen.dart';
import 'package:snipscholar/core/presentation/screens/splash/splash.dart';
import 'package:snipscholar/core/presentation/screens/testScreen/test_screen.dart';
import 'package:snipscholar/dummyDatabase/dummy_screen.dart';

import '../../presentation/screens/authenticaion/signup/signup.dart';

class Routes{
  static Route<dynamic> onGenerateRoute(RouteSettings setting){
    switch(setting.name){
      case RouteNames.splashScreen:
        return MaterialPageRoute(builder: (context)=> const SplashScreen());
      case RouteNames.signUpScreen:
        return MaterialPageRoute(builder: (context)=>  SignUpScreen());
      case RouteNames.signInScreen:
        return MaterialPageRoute(builder: (context)=>  SignInScreen());
      case RouteNames.testScreen:
        return MaterialPageRoute(builder: (context)=>  TestScreen());
      case RouteNames.landingScreen:
        return MaterialPageRoute(builder: (context)=>  DummyDataScreen());
      default:
        return MaterialPageRoute(builder: (context)=> const TestScreen());
    }
  }
}