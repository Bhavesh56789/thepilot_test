import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thepilot_test/features/auth/model/login_state.model.dart';
import 'package:thepilot_test/utils/validartors.dart';

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>(
      (ref) => LoginController(),
    );

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginState());

  void updateEmail(String email) {
    state = state.copyWith(
      email: email,
      emailError: Validators.validateEmail(email),
    );
  }

  void updatePassword(String password) {
    state = state.copyWith(
      password: password,
      passwordError: Validators.validatePassword(password),
    );
  }
}
