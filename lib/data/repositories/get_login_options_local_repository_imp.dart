import 'package:dartz/dartz.dart';
import 'package:organizze_app/data/datasources/get_login_options_local_datasource.dart';
import 'package:organizze_app/domain/repositories/get_login_options_local_repository.dart';

class GetLoginOptionsLocalRepositoryImp
    implements GetLoginOptionsLocalRepository {
  final GetLoginOptionsLocalDatasource _getLoginOptionsLocalDatasource;

  GetLoginOptionsLocalRepositoryImp(this._getLoginOptionsLocalDatasource);
  @override
  Future<Either<Exception, Map<String, dynamic>>> call() async {
    return await _getLoginOptionsLocalDatasource();
  }
}
