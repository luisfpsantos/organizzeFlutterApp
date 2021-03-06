import 'package:organizze_app/data/datasources/firebase/add_entreis_datasource_imp.dart';
import 'package:organizze_app/data/datasources/firebase/get_categories_in_database_datasource_imp.dart';
import 'package:organizze_app/data/repositories/add_entries_repository_imp.dart';
import 'package:organizze_app/data/repositories/get_categories_in_database_repository_imp.dart';
import 'package:organizze_app/domain/usecases/add_entries/add_entreis_usecase_imp.dart';
import 'package:organizze_app/domain/usecases/get_categories_in_database/get_categories_in_database_usecase_imp.dart';
import 'package:organizze_app/presentation/controllers/add_entries_page_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AddEntriesPageDependencies {
  static List<SingleChildWidget> providers() {
    return [
      Provider(
        create: (_) => AddEntriesDatasourceImp(),
      ),
      Provider(
        create: (context) => AddEntriesRepositoryImp(
          context.read<AddEntriesDatasourceImp>(),
        ),
      ),
      Provider(
        create: (context) =>
            AddEntriesUsecaseImp(context.read<AddEntriesRepositoryImp>()),
      ),
      Provider(
        create: (_) => GetCategoriesInDatabaseDatasourceImp(),
      ),
      Provider(
        create: (context) => GetCategoriesInDatabaseRepositoryImp(
          context.read<GetCategoriesInDatabaseDatasourceImp>(),
        ),
      ),
      Provider(
        create: (context) => GetCategoriesInDatabaseUsecaseImp(
            context.read<GetCategoriesInDatabaseRepositoryImp>()),
      ),
      Provider(
        create: (context) => AddEntriesPageController(
            context.read<AddEntriesUsecaseImp>(),
            context.read<GetCategoriesInDatabaseUsecaseImp>()),
      )
    ];
  }
}
