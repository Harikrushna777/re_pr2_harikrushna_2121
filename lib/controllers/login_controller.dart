import 'package:shared_preferences/shared_preferences.dart';

class FirstLoginController {
  final String _isFirst = "isFirst";

  SharedPreferences? sharedPreferences;

  // GetStorage storage = GetStorage();

  bool get isOne {
    return sharedPreferences?.getBool(_isFirst) ?? false;
  }

  setOne() {
    sharedPreferences?.setBool(_isFirst, true);
  }
}
