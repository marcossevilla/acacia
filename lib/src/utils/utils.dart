import 'package:http/http.dart';
import '../shared/preferences.dart';

void refreshTokens(Response res) {
  final prefs = UserPreferences();

  res.headers.forEach(
    (k, v) => {
      if (res.statusCode == 200 && k == "set-cookie")
        {
          prefs.token = parseToken(v, ';', 0),
          prefs.tokenRefresh = parseToken(parseToken(v, ',', 1), ';', 0),
        }
    },
  );
}

String parseToken(String cookie, String parse, int index) =>
    cookie.split(parse)[index];
