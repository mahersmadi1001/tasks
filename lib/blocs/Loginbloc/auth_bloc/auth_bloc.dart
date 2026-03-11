// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:test_packegs/models/Loginmodel.dart';
import 'package:test_packegs/services/authservice.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthService authService;
  AuthBloc(this.authService) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      bool isLogged = await authService.login(loginModel: event.loginModel);
      emit(
        isLogged
            ? AuthSuccess()
            : AuthError(
                errorMessage:
                    "failed to login, plesae check your information and try again...",
              ),
      );
    });
  }
}
