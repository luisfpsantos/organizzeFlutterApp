import 'package:dartz/dartz.dart';

abstract class GetLoginOptionsLocalUsecase {
  Future<Either<Exception, Map<String, dynamic>>> call();
}
