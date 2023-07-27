import 'package:shared_preferences/shared_preferences.dart';

class LocalSaver {
  static String valueSharedPreferences = '';

// Write DATA
  static Future<bool> saveUserToken(value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setInt('token', value);
  }

// Read Data
  static Future getUserToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt('token');
  }
}
