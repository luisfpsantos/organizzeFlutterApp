import 'package:dartz/dartz.dart';

abstract class VerifyLoginWithDatabaseDatasource {
  Future<Either<Exception, bool>> call(String user, String password);
}
