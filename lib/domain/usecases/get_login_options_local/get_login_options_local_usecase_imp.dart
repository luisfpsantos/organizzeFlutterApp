import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/repositories/get_login_options_local_repository.dart';
import 'package:organizze_app/domain/usecases/get_login_options_local/get_login_options_local_usecase.dart';

class GetLoginOptionsLocalUsecaseImp implements GetLoginOptionsLocalUsecase {
  final GetLoginOptionsLocalRepository _getLoginOptionsLocalRepository;

  GetLoginOptionsLocalUsecaseImp(this._getLoginOptionsLocalRepository);
  @override
  Future<Either<Exception, Map<String, dynamic>>> call() async {
    return await _getLoginOptionsLocalRepository();
  }
}
