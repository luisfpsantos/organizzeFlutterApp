import 'package:dartz/dartz.dart';
import 'package:organizze_app/data/datasources/get_auth_biometry_datasource.dart';
import 'package:organizze_app/domain/repositories/get_auth_biometry_repository.dart';

class GetAuthBiometryRepositoryImp implements GetAuthBiometryRepository {
  final GetAuthBiometryDatasource _getAuthBiometryDatasource;

  GetAuthBiometryRepositoryImp(this._getAuthBiometryDatasource);
  @override
  Future<Either<Exception, bool>> call() async {
    return await _getAuthBiometryDatasource();
  }
}
