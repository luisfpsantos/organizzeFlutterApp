import 'package:dartz/dartz.dart';

abstract class GetAuthBiometryRepository {
  Future<Either<Exception, bool>> call();
}
