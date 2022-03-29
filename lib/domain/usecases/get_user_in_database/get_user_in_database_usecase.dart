import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';

abstract class GetUserInDatabaseUsecase {
  Future<Either<Exception, UserEntity>> call(String user);
}
