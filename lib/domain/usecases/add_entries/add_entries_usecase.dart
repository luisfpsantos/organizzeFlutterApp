import 'package:dartz/dartz.dart';

abstract class AddEntriesUsecase {
  Future<Either<Exception, bool>> call(
      Map<String, dynamic> entry, String loggedUser);
}
