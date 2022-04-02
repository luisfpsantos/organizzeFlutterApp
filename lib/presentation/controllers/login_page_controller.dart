import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';
import 'package:organizze_app/domain/usecases/get_auth_biometry/get_auth_biometry_usecase.dart';
import 'package:organizze_app/domain/usecases/get_login_options_local/get_login_options_local_usecase.dart';
import 'package:organizze_app/domain/usecases/get_user_in_database/get_user_in_database_usecase.dart';
import 'package:organizze_app/domain/usecases/save_login_options_local/save_login_options_local_usecase.dart';
import 'package:organizze_app/domain/usecases/verify_login_with_database/verify_login_with_database_usecase.dart';

class LoginPageController {
  final VerifyLoginWithDatabaseUsecase _verifyLoginWithDatabaseUsecase;
  final GetUserInDatabaseUsecase _getUserInDatabaseUsecase;
  final SaveLoginOptionsLocalUsecase _saveLoginOptionsLocalUsecase;
  final GetLoginOptionsLocalUsecase _getLoginOptionsLocalUsecase;
  final GetAuthBiometryUsecase _getAuthBiometryUsecase;

  LoginPageController(
    this._verifyLoginWithDatabaseUsecase,
    this._getUserInDatabaseUsecase,
    this._saveLoginOptionsLocalUsecase,
    this._getLoginOptionsLocalUsecase,
    this._getAuthBiometryUsecase,
  );

  Future<Either<Exception, bool>> verifyLogin(
      String user, String password) async {
    return await _verifyLoginWithDatabaseUsecase(user, password);
  }

  Future<Either<Exception, UserEntity>> getUserInDatabase(String user) async {
    return await _getUserInDatabaseUsecase(user);
  }

  Future<Either<Exception, bool>> saveLoginOptionsLocal(
      Map<String, dynamic> map) async {
    return await _saveLoginOptionsLocalUsecase(map);
  }

  Future<Either<Exception, Map<String, dynamic>>> getLoginOptionsLocal() async {
    return await _getLoginOptionsLocalUsecase();
  }

  Future<Either<Exception, bool>> getAuthBiometry() async {
    return await _getAuthBiometryUsecase();
  }
}
