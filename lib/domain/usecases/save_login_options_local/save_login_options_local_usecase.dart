import 'package:dartz/dartz.dart';

abstract class SaveLoginOptionsLocalUsecase {
  Future<Either<Exception, bool>> call(Map<String, dynamic> map);
}
