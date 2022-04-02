import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/repositories/get_auth_biometry_repository.dart';
import 'package:organizze_app/domain/usecases/get_auth_biometry/get_auth_biometry_usecase.dart';

class GetAuthBiometryUsecaseImp implements GetAuthBiometryUsecase {
  final GetAuthBiometryRepository _getAuthBiometryRepository;

  GetAuthBiometryUsecaseImp(this._getAuthBiometryRepository);
  @override
  Future<Either<Exception, bool>> call() async {
    return await _getAuthBiometryRepository();
  }
}
