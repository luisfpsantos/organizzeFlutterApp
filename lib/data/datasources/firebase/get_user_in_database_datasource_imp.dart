import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:organizze_app/data/datasources/get_user_in_database_datasource.dart';
import 'package:organizze_app/data/dtos/user_dto.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';
import 'package:organizze_app/domain/errors/get_user_in_database_errors.dart';

class GetUserInDatabaseDatasourceImp implements GetUserInDatabaseDatasource {
  @override
  Future<Either<Exception, UserEntity>> call(String user) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    try {
      var result = await users.where('user', isEqualTo: user).get();

      if (result.docs.isEmpty) {
        return left(GetUserNotFound());
      } else {
        String json = jsonEncode(result.docs[0].data());
        Map<String, dynamic> jsonMap = jsonDecode(json);
        return right(UserDto.fromMap(jsonMap));
      }
    } catch (e) {
      return left(GetUserDatasourceError());
    }
  }
}
