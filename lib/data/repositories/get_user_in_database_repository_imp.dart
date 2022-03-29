import 'package:organizze_app/data/datasources/get_user_in_database_datasource.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/repositories/get_user_in_database_repository.dart';

class GetUserInDatabaseRepositoryImp implements GetUserInDatabaseRepository {
  final GetUserInDatabaseDatasource _getUserInDatabaseDatasource;

  GetUserInDatabaseRepositoryImp(this._getUserInDatabaseDatasource);
  @override
  Future<Either<Exception, UserEntity>> call(String user) async {
    return await _getUserInDatabaseDatasource(user);
  }
}
