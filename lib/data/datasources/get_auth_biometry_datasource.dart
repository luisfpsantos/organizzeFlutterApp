import 'package:dartz/dartz.dart';

abstract class GetAuthBiometryDatasource {
  Future<Either<Exception, bool>> call();
}
