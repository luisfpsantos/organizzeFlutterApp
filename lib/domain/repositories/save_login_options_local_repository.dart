import 'package:dartz/dartz.dart';

abstract class SaveLoginOptionsLocalRepository {
  Future<Either<Exception, bool>> call(Map<String, dynamic> map);
}
