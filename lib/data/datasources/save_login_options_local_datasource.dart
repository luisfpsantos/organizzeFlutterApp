import 'package:dartz/dartz.dart';

abstract class SaveLoginOptionsLocalDatasource {
  Future<Either<Exception, bool>> call(Map<String, dynamic> map);
}
