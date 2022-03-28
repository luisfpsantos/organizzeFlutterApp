import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/errors/verify_login_with_database_errors.dart';
import 'package:organizze_app/domain/repositories/verify_login_with_database_repository.dart';
import 'package:organizze_app/domain/usecases/verify_login_with_database/verify_login_with_database_usecase.dart';

class VerifyLoginWithDatabaseUsecaseImp
    implements VerifyLoginWithDatabaseUsecase {
  final VerifyLoginWithDatabaseRepository _verifyLoginWithDatabaseRepository;

  VerifyLoginWithDatabaseUsecaseImp(this._verifyLoginWithDatabaseRepository);
  @override
  Future<Either<Exception, bool>> call(String user, String password) async {
    if (user.isEmpty || user.length <= 3) {
      return left(InvalidUser());
    }
    if (password.isEmpty || password.length <= 3) {
      return left(InvalidPassword());
    }

    return await _verifyLoginWithDatabaseRepository(user, password);
  }
}
