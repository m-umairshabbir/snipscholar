import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService{
  static Future<void> saveLoginState(bool isLoggedIn)async{
    final prefs=await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
  }

  static Future<bool> getLoginState()async{
    final prefs=await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
  static Future<void> clearLoginState()async{
    final prefs=await SharedPreferences.getInstance();
    prefs.remove('isLoggedIn');
  }
}