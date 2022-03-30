import 'package:dartz/dartz.dart';
import 'package:organizze_app/data/datasources/save_login_options_local_datasource.dart';
import 'package:organizze_app/domain/repositories/save_login_options_local_repository.dart';

class SaveLoginOptionsLocalRepositoryImp
    implements SaveLoginOptionsLocalRepository {
  final SaveLoginOptionsLocalDatasource _saveLoginOptionsLocalDatasource;

  SaveLoginOptionsLocalRepositoryImp(this._saveLoginOptionsLocalDatasource);
  @override
  Future<Either<Exception, bool>> call(Map<String, dynamic> map) async {
    return _saveLoginOptionsLocalDatasource(map);
  }
}
