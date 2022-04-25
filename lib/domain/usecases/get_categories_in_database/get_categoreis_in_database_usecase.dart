import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/entities/user_category_entity.dart';

abstract class GetCategoriesInDatabaseUsecase {
  Future<Either<Exception, List<UserCategoryEntity>>> call(String loggedUser);
}
