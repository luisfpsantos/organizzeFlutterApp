import 'package:organizze_app/domain/entities/user_category_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/repositories/get_categories_in_database_repository.dart';
import 'package:organizze_app/domain/usecases/get_categories_in_database/get_categoreis_in_database_usecase.dart';

class GetCategoriesInDatabaseUsecaseImp
    implements GetCategoriesInDatabaseUsecase {
  final GetCategoriesInDatabaseRepository _getCategoriesInDatabaseRepository;

  GetCategoriesInDatabaseUsecaseImp(this._getCategoriesInDatabaseRepository);
  @override
  Future<Either<Exception, List<UserCategoryEntity>>> call(
      String loggedUser) async {
    return await _getCategoriesInDatabaseRepository(loggedUser);
  }
}
