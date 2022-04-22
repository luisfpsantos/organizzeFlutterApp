import 'package:dartz/dartz.dart';
import 'package:organizze_app/domain/repositories/add_entries_repository.dart';
import 'package:organizze_app/domain/usecases/add_entries/add_entries_usecase.dart';

class AddEntriesUsecaseImp implements AddEntriesUsecase {
  final AddEntriesRepository _addEntriesRepository;

  AddEntriesUsecaseImp(this._addEntriesRepository);
  @override
  Future<Either<Exception, bool>> call(
      Map<String, dynamic> entry, String loggedUser) async {
    return await _addEntriesRepository(entry, loggedUser);
  }
}
