import 'package:dartz/dartz.dart';

abstract class AddAccountUsecase {
  Future<Either<Exception, bool>> call(
      Map<String, dynamic> account, String loggedUser);
}
