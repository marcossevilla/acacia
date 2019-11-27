import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // singleton implementation
  static final UserPreferences _instance = UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  /*
  *   getters and setters
  */

  get token {
    return _prefs.getString('token') ?? 'no-token';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  get permanentToken {
    return _prefs.getString('permanent-token') ?? 'no-token';
  }

  set permanentToken(String value) {
    _prefs.setString('permanent-token', value);
  }

  get tokenRefresh {
    return _prefs.getString('token-refresh') ?? 'no-token';
  }

  set tokenRefresh(String value) {
    _prefs.setString('token-refresh', value);
  }
}
