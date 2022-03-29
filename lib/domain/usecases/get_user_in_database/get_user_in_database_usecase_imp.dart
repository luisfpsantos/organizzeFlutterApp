import 'package:organizze_app/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/repositories/get_user_in_database_repository.dart';
import 'package:organizze_app/domain/usecases/get_user_in_database/get_user_in_database_usecase.dart';

class GetUserInDatabaseUsecaseImp implements GetUserInDatabaseUsecase {
  final GetUserInDatabaseRepository _getUserInDatabaseRepository;

  GetUserInDatabaseUsecaseImp(this._getUserInDatabaseRepository);
  @override
  Future<Either<Exception, UserEntity>> call(String user) async {
    return await _getUserInDatabaseRepository(user);
  }
}
