import 'package:flutter/material.dart';
import 'package:organizze_app/domain/errors/get_login_options_local_errors.dart';
import 'package:organizze_app/domain/errors/verify_login_with_database_errors.dart';
import 'package:organizze_app/domain/usecases/get_login_options_local/get_login_options_local_usecase.dart';
import 'package:organizze_app/domain/usecases/get_user_in_database/get_user_in_database_usecase.dart';
import 'package:organizze_app/domain/usecases/save_login_options_local/save_login_options_local_usecase.dart';
import 'package:organizze_app/domain/usecases/verify_login_with_database/verify_login_with_database_usecase.dart';
import 'package:organizze_app/presentation/ui/pages/login_page/login_page_state/login_page_states.dart';

class LoginPageController {
  final VerifyLoginWithDatabaseUsecase _verifyLoginWithDatabaseUsecase;
  final GetUserInDatabaseUsecase _getUserInDatabaseUsecase;
  final SaveLoginOptionsLocalUsecase _saveLoginOptionsLocalUsecase;
  final GetLoginOptionsLocalUsecase _getLoginOptionsLocalUsecase;
  final loginPageState = ValueNotifier<LoginPageStates>(LoginPageIdle());
  final checkbox = ValueNotifier<LoginPageStates>(LoginCheckbox(false));

  LoginPageController(
    this._verifyLoginWithDatabaseUsecase,
    this._getUserInDatabaseUsecase,
    this._saveLoginOptionsLocalUsecase,
    this._getLoginOptionsLocalUsecase,
  );

  Future verifyLogin(String user, String password) async {
    loginPageState.value = Onloading();

    var result = await _verifyLoginWithDatabaseUsecase(user, password);
    result.fold(
      (exception) => {
        if (exception is InvalidUser || exception is UserNotfound)
          {
            loginPageState.value = OnError(inputUserError: 'Usuario Incorreto'),
          },
        if (exception is InvalidPassword)
          {
            loginPageState.value =
                OnError(inputPasswordError: 'Senha Incorreta'),
          },
        if (exception is ErrorDataSource)
          {
            loginPageState.value = OnError(msgError: 'Contatar Administrador'),
          }
      },
      (success) => {
        if (success)
          {
            loginPageState.value = UserVerified(),
          }
        else
          {
            loginPageState.value = OnError(msgError: 'Usuario não autenticado'),
          }
      },
    );
  }

  Future getUserInDatabase(String user) async {
    loginPageState.value = Onloading();

    var result = await _getUserInDatabaseUsecase(user);
    result.fold(
      (exception) => {
        loginPageState.value =
            OnError(msgError: 'Erro ao capturar usuario na base de dados'),
      },
      (success) => {
        loginPageState.value = OnSuccess(success),
      },
    );
  }

  Future saveLoginOptionsLocal(Map<String, dynamic> map) async {
    var result = await _saveLoginOptionsLocalUsecase(map);
    result.fold(
      (exception) => {
        loginPageState.value = OnError(
            msgError: 'Não foi possivel Guardar informações do usúario'),
      },
      (success) => {},
    );
  }

  Future getLoginOptionsLocal() async {
    var result = await _getLoginOptionsLocalUsecase();
    result.fold(
      (exception) => {
        if (exception is LoginLocalNotFound)
          {
            loginPageState.value = LoginPageIdle(),
          },
        if (exception is GetLoginOptionsDatasourceError)
          {
            loginPageState.value =
                OnError(msgError: 'Falha ao buscar usuario salvo'),
          }
      },
      (success) => {
        checkbox.value = LoginCheckbox(true),
        loginPageState.value = OptionsLoginFounded(success),
      },
    );
  }
}
