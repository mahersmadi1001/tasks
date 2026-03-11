import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_packegs/models/Loginmodel.dart';
import 'package:test_packegs/services/di.dart';
import 'package:test_packegs/services/user_session_service.dart';

class AuthService {
  late UserSessionService userSessionService;
  Dio dio = Dio();
  final String baseUrl = "https://dummyjson.com/auth/login";
  late Response response;
  Future<bool> login({required LoginModel loginModel}) async {
    try {
      response = await dio.post(baseUrl, data: loginModel.toMap());
      if (response.statusCode == 200) {
        print(response.data);
        getIt.get<SharedPreferences>().setString(
          "token",
          response.data["accessToken"],
        );
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  void signup() {}
  void signout() {}
}
