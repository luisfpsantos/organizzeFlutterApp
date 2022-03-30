import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:organizze_app/data/datasources/get_login_options_local_datasource.dart';
import 'package:organizze_app/domain/errors/get_login_options_local_errors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetLoginOptionsLocalDatasourceImp
    implements GetLoginOptionsLocalDatasource {
  @override
  Future<Either<Exception, Map<String, dynamic>>> call() async {
    const userKey = 'localOptions';

    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final String jsonString = sharedPreferences.getString(userKey) ?? '{}';

      final Map<String, dynamic> jsonDecoded =
          json.decode(jsonString) as Map<String, dynamic>;

      if (jsonDecoded.isEmpty) {
        return left(LoginLocalNotFound());
      }

      return right(jsonDecoded);
    } catch (e) {
      return left(GetLoginOptionsDatasourceError());
    }
  }
}
