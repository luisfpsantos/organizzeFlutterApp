import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:organizze_app/data/datasources/verify_login_with_databse_datasource.dart';
import 'package:organizze_app/domain/errors/verify_login_with_database_errors.dart';

class VerifyLoginWithDatabaseDatasourceImp
    implements VerifyLoginWithDatabaseDatasource {
  @override
  Future<Either<Exception, bool>> call(String user, String password) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    try {
      var result =
          await users.where('user', isEqualTo: user.toLowerCase()).get();

      if (result.docs.isEmpty) {
        return left(UserNotfound());
      }

      if (result.docs[0].get('password') != password) {
        return left(InvalidPassword());
      }

      if (result.docs[0].get('password') == password) {
        return right(true);
      }
      return right(false);
    } catch (e) {
      return left(ErrorDataSource());
    }
  }
}
