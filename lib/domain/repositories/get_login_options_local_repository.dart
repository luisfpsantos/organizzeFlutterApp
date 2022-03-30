import 'package:dartz/dartz.dart';

abstract class GetLoginOptionsLocalRepository {
  Future<Either<Exception, Map<String, dynamic>>> call();
}
