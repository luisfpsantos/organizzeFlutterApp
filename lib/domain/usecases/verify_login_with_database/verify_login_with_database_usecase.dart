import 'package:dartz/dartz.dart';

abstract class VerifyLoginWithDatabaseUsecase {
  Future<Either<Exception, bool>> call(String user, String password);
}
