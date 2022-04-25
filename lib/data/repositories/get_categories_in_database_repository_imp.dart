import 'package:organizze_app/data/datasources/get_categories_in_database_datasource.dart';
import 'package:organizze_app/domain/entities/user_category_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/repositories/get_categories_in_database_repository.dart';

class GetCategoriesInDatabaseRepositoryImp
    implements GetCategoriesInDatabaseRepository {
  final GetCategoriesInDatabaseDatasource _getCategoriesInDatabaseDatasource;

  GetCategoriesInDatabaseRepositoryImp(this._getCategoriesInDatabaseDatasource);
  @override
  Future<Either<Exception, List<UserCategoryEntity>>> call(
      String loggedUser) async {
    return await _getCategoriesInDatabaseDatasource(loggedUser);
  }
}
