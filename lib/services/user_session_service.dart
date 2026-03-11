// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

class UserSessionService {
  final String _firstTimeOpenKey = "first_time";
  final String _token = "token";
  SharedPreferences sharedPreferences;
  UserSessionService({required this.sharedPreferences});

  bool isFirstTimeOpen() {
    print(
      "${sharedPreferences.getBool(_firstTimeOpenKey)}       _firstTimeOpenKey  قيمة  ",
    );
    return sharedPreferences.getBool(_firstTimeOpenKey) ?? true;
  }

  bool isAuthenticated() {
    bool hasToken = !(sharedPreferences.getString(_token) == null);
    return hasToken;
  }

  Future<void> completeOnboarding() async {
    print("completeOnboarding fun");
    await sharedPreferences.setBool(_firstTimeOpenKey, false);
  }

  // Future<void> saveToken({required String? token}) async {
  //   await sharedPreferences.setString(_token, token!);
  // }

  void clearToken() {
    sharedPreferences.remove(_token);
  }
}
