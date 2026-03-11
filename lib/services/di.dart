
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_packegs/services/authservice.dart';
import 'package:test_packegs/services/user_session_service.dart';

GetIt getIt = GetIt.instance;

Future<void> setup() async {
  // ! SharedPreferences
  getIt.registerSingleton(await SharedPreferences.getInstance());
  // ! UserSessionService
  getIt.registerSingleton(
    UserSessionService(sharedPreferences: getIt<SharedPreferences>()),
  );
    getIt.registerSingleton(AuthService());

}