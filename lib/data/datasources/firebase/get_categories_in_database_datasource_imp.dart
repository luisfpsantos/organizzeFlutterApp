import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:organizze_app/data/datasources/get_categories_in_database_datasource.dart';
import 'package:organizze_app/data/dtos/user_category_dto.dart';
import 'package:organizze_app/domain/entities/user_category_entity.dart';
import 'package:organizze_app/domain/errors/get_categories_in_database_errors.dart';

class GetCategoriesInDatabaseDatasourceImp
    implements GetCategoriesInDatabaseDatasource {
  @override
  Future<Either<Exception, List<UserCategoryEntity>>> call(
      String loggedUser) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    List<UserCategoryEntity> userCategories = [];

    try {
      var user = await users.where('user', isEqualTo: loggedUser).get();

      CollectionReference collectionCategories = FirebaseFirestore.instance
          .collection('users/${user.docs[0].id}/categories');

      var _categories = await collectionCategories.get();

      if (_categories.docs.isEmpty) {
        return left(NoCategoriesFound());
      }

      for (var category in _categories.docs) {
        userCategories.add(
            UserCategoryDto.fromMap(category.data() as Map<String, dynamic>));
      }
      return right(userCategories);
    } catch (e) {
      return left(GetCategoriesInDatabaseDatasourceError());
    }
  }
}
