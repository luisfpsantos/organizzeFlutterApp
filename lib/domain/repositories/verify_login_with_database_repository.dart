import 'package:dartz/dartz.dart';

abstract class VerifyLoginWithDatabaseRepository {
  Future<Either<Exception, bool>> call(String user, String password);
}
