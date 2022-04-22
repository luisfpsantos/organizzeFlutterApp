import 'package:dartz/dartz.dart';

abstract class AddEntriesRepository {
  Future<Either<Exception, bool>> call(
      Map<String, dynamic> entry, String loggedUser);
}
