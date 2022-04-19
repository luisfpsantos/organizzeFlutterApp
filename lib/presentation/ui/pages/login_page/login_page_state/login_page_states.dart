import 'package:flutter/cupertino.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';

class LoginPageStates {
  final inputUserController = TextEditingController();
  final inputPassowordController = TextEditingController();
}

class LoginPageIdle extends LoginPageStates {}

class Onloading extends LoginPageStates {}

class OnError extends LoginPageStates {
  final String msgError;

  OnError(this.msgError);

  String inputUserError() {
    return msgError;
  }

  String inputPasswordError() {
    return msgError;
  }
}

class OnSuccess extends LoginPageStates {
  final UserEntity loggedUser;

  OnSuccess(this.loggedUser);
}

class OptionsLoginFounded extends LoginPageStates {
  final bool hasLogin;
  final Map<String, dynamic> login;

  setInputUserValue() {
    inputUserController.text = login['user'];
  }

  setInputPasswordValue() {
    inputUserController.text = login['password'];
  }

  OptionsLoginFounded(this.hasLogin, this.login);
}

class LoginCheckbox extends LoginPageStates {
  final bool cheked;

  LoginCheckbox(this.cheked);
}
