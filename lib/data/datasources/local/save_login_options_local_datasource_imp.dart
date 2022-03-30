import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:organizze_app/data/datasources/save_login_options_local_datasource.dart';
import 'package:organizze_app/domain/errors/save_login_options_local_errors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveLoginOptionsLocalDatasourceImp
    implements SaveLoginOptionsLocalDatasource {
  @override
  Future<Either<Exception, bool>> call(Map<String, dynamic> map) async {
    const userKey = 'localOptions';
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      final String jsonString = json.encode(map);

      var result = await sharedPreferences.setString(userKey, jsonString);

      if (!result) left(CanNotSaveLocalOptions());
      return right(result);
    } catch (e) {
      return left(SaveLocalDatasourceError());
    }
  }
}
