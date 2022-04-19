import 'package:organizze_app/data/datasources/firebase/get_user_in_database_datasource_imp.dart';
import 'package:organizze_app/data/datasources/firebase/verify_login_with_databse_datasource_imp.dart';
import 'package:organizze_app/data/datasources/local/get_login_options_local_datasource_imp.dart';
import 'package:organizze_app/data/datasources/local/save_login_options_local_datasource_imp.dart';
import 'package:organizze_app/data/repositories/get_login_options_local_repository_imp.dart';
import 'package:organizze_app/data/repositories/get_user_in_database_repository_imp.dart';
import 'package:organizze_app/data/repositories/save_login_options_local_repository_imp.dart';
import 'package:organizze_app/data/repositories/verify_login_with_database_repository_imp.dart';
import 'package:organizze_app/domain/usecases/get_login_options_local/get_login_options_local_usecase_imp.dart';
import 'package:organizze_app/domain/usecases/get_user_in_database/get_user_in_database_usecase_imp.dart';
import 'package:organizze_app/domain/usecases/save_login_options_local/save_login_options_local_usecase_imp.dart';
import 'package:organizze_app/domain/usecases/verify_login_with_database/verify_login_with_database_usecase_imp.dart';
import 'package:organizze_app/presentation/controllers/login_page_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class LoginPageDependencies {
  static List<SingleChildWidget> providers() {
    return [
      //
      //VerifyLoginWithDatabase USECASE
      //
      Provider(
        create: (_) => VerifyLoginWithDatabaseDatasourceImp(),
      ),
      Provider(
        create: (context) => VerifyLoginWithDatabaseRepositoryImp(
            context.read<VerifyLoginWithDatabaseDatasourceImp>()),
      ),
      Provider(
        create: (context) => VerifyLoginWithDatabaseUsecaseImp(
            context.read<VerifyLoginWithDatabaseRepositoryImp>()),
      ),
      //
      //GetUserInDatabase USECASE
      //
      Provider(
        create: (_) => GetUserInDatabaseDatasourceImp(),
      ),
      Provider(
        create: (context) => GetUserInDatabaseRepositoryImp(
            context.read<GetUserInDatabaseDatasourceImp>()),
      ),
      Provider(
        create: (context) => GetUserInDatabaseUsecaseImp(
            context.read<GetUserInDatabaseRepositoryImp>()),
      ),
      //
      //SaveLoginOptionsLocal USECASE
      //
      Provider(
        create: (_) => SaveLoginOptionsLocalDatasourceImp(),
      ),
      Provider(
        create: (context) => SaveLoginOptionsLocalRepositoryImp(
            context.read<SaveLoginOptionsLocalDatasourceImp>()),
      ),
      Provider(
        create: (context) => SaveLoginOptionsLocalUsecaseImp(
            context.read<SaveLoginOptionsLocalRepositoryImp>()),
      ),
      //
      //GetLoginOptionsLocal USECASE
      //
      Provider(
        create: (_) => GetLoginOptionsLocalDatasourceImp(),
      ),
      Provider(
        create: (context) => GetLoginOptionsLocalRepositoryImp(
            context.read<GetLoginOptionsLocalDatasourceImp>()),
      ),
      Provider(
        create: (context) => GetLoginOptionsLocalUsecaseImp(
            context.read<GetLoginOptionsLocalRepositoryImp>()),
      ),
      Provider(
        create: (context) => LoginPageController(
            context.read<VerifyLoginWithDatabaseUsecaseImp>(),
            context.read<GetUserInDatabaseUsecaseImp>(),
            context.read<SaveLoginOptionsLocalUsecaseImp>(),
            context.read<GetLoginOptionsLocalUsecaseImp>()),
      )
    ];
  }
}
