import 'package:dartz/dartz.dart';
import 'package:organizze_app/data/datasources/verify_login_with_databse_datasource.dart';
import 'package:organizze_app/domain/repositories/verify_login_with_database_repository.dart';

class VerifyLoginWithDatabaseRepositoryImp
    implements VerifyLoginWithDatabaseRepository {
  final VerifyLoginWithDatabaseDatasource _verifyLoginWithDatabaseDatasource;

  VerifyLoginWithDatabaseRepositoryImp(this._verifyLoginWithDatabaseDatasource);
  @override
  Future<Either<Exception, bool>> call(String user, String password) async {
    return await _verifyLoginWithDatabaseDatasource(user, password);
  }
}
