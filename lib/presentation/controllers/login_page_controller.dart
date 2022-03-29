import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';
import 'package:organizze_app/domain/usecases/get_user_in_database/get_user_in_database_usecase.dart';
import 'package:organizze_app/domain/usecases/verify_login_with_database/verify_login_with_database_usecase.dart';

class LoginPageController {
  final VerifyLoginWithDatabaseUsecase _verifyLoginWithDatabaseUsecase;
  final GetUserInDatabaseUsecase _getUserInDatabaseUsecase;

  LoginPageController(
      this._verifyLoginWithDatabaseUsecase, this._getUserInDatabaseUsecase);

  Future<Either<Exception, bool>> verifyLogin(
      String user, String password) async {
    return await _verifyLoginWithDatabaseUsecase(user, password);
  }

  Future<Either<Exception, UserEntity>> getUser(String user) async {
    return await _getUserInDatabaseUsecase(user);
  }
}
