import 'package:dartz/dartz.dart';

abstract class GetLoginOptionsLocalDatasource {
  Future<Either<Exception, Map<String, dynamic>>> call();
}
