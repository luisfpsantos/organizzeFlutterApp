import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/entities/user_category_entity.dart';

abstract class GetCategoriesInDatabaseRepository {
  Future<Either<Exception, List<UserCategoryEntity>>> call(String loggedUser);
}
