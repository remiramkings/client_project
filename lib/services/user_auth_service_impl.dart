import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/user_auth_service.dart.dart';

class UserAuthServiceimpl implements UserAuthService {
  static const String KEY_TOKEN = 'token';
  @override
  Future<String?> authenticate() async {
    final String? tokenValue = (await getInstance()).getString(KEY_TOKEN);
    return tokenValue;
  }

  @override
  Future<bool> login(String email, String password) async {
    if (email == 'admin' && password == 'admin') {
      String tokenValue = '12345LoggedIn';
      (await getInstance()).setString(KEY_TOKEN, tokenValue);
      return true;
    }
    return false;
  }

  Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }

  @override
  logout() async {
    (await getInstance()).remove(KEY_TOKEN);
  }
}
