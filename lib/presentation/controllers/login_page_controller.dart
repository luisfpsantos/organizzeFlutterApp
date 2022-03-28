import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/usecases/verify_login_with_database/verify_login_with_database_usecase.dart';

class LoginPageController {
  final VerifyLoginWithDatabaseUsecase _verifyLoginWithDatabaseUsecase;

  LoginPageController(this._verifyLoginWithDatabaseUsecase);

  Future<Either<Exception, bool>> verifyLogin(
      String user, String password) async {
    return await _verifyLoginWithDatabaseUsecase(user, password);
  }
}
