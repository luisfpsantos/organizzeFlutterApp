import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/repositories/save_login_options_local_repository.dart';
import 'package:organizze_app/domain/usecases/save_login_options_local/save_login_options_local_usecase.dart';

class SaveLoginOptionsLocalUsecaseImp implements SaveLoginOptionsLocalUsecase {
  final SaveLoginOptionsLocalRepository _saveLoginOptionsLocalRepository;

  SaveLoginOptionsLocalUsecaseImp(this._saveLoginOptionsLocalRepository);
  @override
  Future<Either<Exception, bool>> call(Map<String, dynamic> map) async {
    return await _saveLoginOptionsLocalRepository(map);
  }
}
