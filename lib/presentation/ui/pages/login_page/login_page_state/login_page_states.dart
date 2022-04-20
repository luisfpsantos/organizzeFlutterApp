import 'package:organizze_app/domain/entities/user_entity.dart';

abstract class LoginPageStates {}

class LoginPageIdle extends LoginPageStates {}

class Onloading extends LoginPageStates {}

class UserVerified extends LoginPageStates {}

class OnError extends LoginPageStates {
  final String? msgError;
  final String? inputUserError;
  final String? inputPasswordError;

  OnError({this.msgError, this.inputUserError, this.inputPasswordError});
}

class OnSuccess extends LoginPageStates {
  final UserEntity loggedUser;

  OnSuccess(this.loggedUser);
}

class OptionsLoginFounded extends LoginPageStates {
  final Map<String, dynamic> login;

  OptionsLoginFounded(this.login);
}

class LoginCheckbox extends LoginPageStates {
  final bool cheked;

  LoginCheckbox(this.cheked);
}
