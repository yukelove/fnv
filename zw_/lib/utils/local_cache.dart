import 'package:shared_preferences/shared_preferences.dart';

class LocalCache {
  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static saveStringValueForKey({required String key,required String value}){
    LocalCache._prefs.then((prefs) {
      prefs.setString(key, value);
    });
  }

  static Future<String> getStringValueForKey({required String key}){
    return LocalCache._prefs.then((prefs) {
      var stringValue = prefs.getString(key);
      return Future.value(stringValue);
    });
  }
  
  


}