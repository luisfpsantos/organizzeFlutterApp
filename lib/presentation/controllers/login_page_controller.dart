import 'package:flutter/material.dart';
import 'package:organizze_app/domain/errors/get_login_options_local_errors.dart';
import 'package:organizze_app/domain/errors/verify_login_with_database_errors.dart';
import 'package:organizze_app/domain/usecases/get_login_options_local/get_login_options_local_usecase.dart';
import 'package:organizze_app/domain/usecases/get_user_in_database/get_user_in_database_usecase.dart';
import 'package:organizze_app/domain/usecases/save_login_options_local/save_login_options_local_usecase.dart';
import 'package:organizze_app/domain/usecases/verify_login_with_database/verify_login_with_database_usecase.dart';
import 'package:organizze_app/presentation/ui/pages/login_page/login_page_state/login_page_states.dart';

class LoginPageController extends ValueNotifier<LoginPageStates> {
  final VerifyLoginWithDatabaseUsecase _verifyLoginWithDatabaseUsecase;
  final GetUserInDatabaseUsecase _getUserInDatabaseUsecase;
  final SaveLoginOptionsLocalUsecase _saveLoginOptionsLocalUsecase;
  final GetLoginOptionsLocalUsecase _getLoginOptionsLocalUsecase;

  LoginPageController(
    this._verifyLoginWithDatabaseUsecase,
    this._getUserInDatabaseUsecase,
    this._saveLoginOptionsLocalUsecase,
    this._getLoginOptionsLocalUsecase,
  ) : super(LoginPageIdle());

  Future verifyLogin(String user, String password) async {
    value = Onloading();
    var result = await _verifyLoginWithDatabaseUsecase(user, password);
    result.fold(
      (exception) => {
        if (exception is InvalidUser || exception is UserNotfound)
          {
            value = OnError('Usúario Incorreto'),
          },
        if (exception is InvalidPassword)
          {
            value = OnError('Senha Incorreta'),
          },
        if (exception is ErrorDataSource)
          {
            value = OnError('Contatar Administrador'),
          }
      },
      (success) => {
        if (success)
          {
            getUserInDatabase(user),
          }
        else
          {
            value = OnError('Usuario não autenticado'),
          }
      },
    );
  }

  Future getUserInDatabase(String user) async {
    var result = await _getUserInDatabaseUsecase(user);
    result.fold(
      (exception) => {
        value = OnError('Erro ao capturar usuario na base de dados'),
      },
      (success) => {
        value = OnSuccess(success),
      },
    );
  }

  Future saveLoginOptionsLocal(Map<String, dynamic> map) async {
    var result = await _saveLoginOptionsLocalUsecase(map);
    result.fold(
      (exception) => {
        value = OnError('Não foi possivel Guardar informações do usúario'),
      },
      (success) => {
        value = LoginPageIdle(),
      },
    );
  }

  Future getLoginOptionsLocal() async {
    var result = await _getLoginOptionsLocalUsecase();
    result.fold(
      (exception) => {
        if (exception is LoginLocalNotFound)
          {
            value = OptionsLoginFounded(false, {}),
          },
        if (exception is GetLoginOptionsDatasourceError)
          {
            value = OnError('Falha ao buscar usuario salvo'),
          }
      },
      (success) => {
        value = OptionsLoginFounded(true, success),
      },
    );
  }
}
