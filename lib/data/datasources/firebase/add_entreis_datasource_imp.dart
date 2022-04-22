import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:organizze_app/data/datasources/add_entreis_datasource.dart';
import 'package:organizze_app/domain/errors/add_entries_erros.dart';

class AddEntriesDatasourceImp implements AddEntriesDatasource {
  @override
  Future<Either<Exception, bool>> call(
      Map<String, dynamic> entry, String loggedUser) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    try {
      var user = await users.where('user', isEqualTo: loggedUser).get();

      CollectionReference entries = FirebaseFirestore.instance
          .collection('users/${user.docs[0].id}/entries');

      await entries.add(entry);

      return right(true);
    } catch (e) {
      return left(AddEntriesDatasourceError());
    }
  }
}
