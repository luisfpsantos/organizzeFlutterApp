import 'package:dartz/dartz.dart';

abstract class GetAuthBiometryUsecase {
  Future<Either<Exception, bool>> call();
}
