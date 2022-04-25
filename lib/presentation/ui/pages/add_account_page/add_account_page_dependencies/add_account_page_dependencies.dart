import 'package:organizze_app/data/datasources/local/get_images_from_assets_datasource_imp.dart';
import 'package:organizze_app/data/repositories/get_images_from_assets_repository_imp.dart';
import 'package:organizze_app/domain/usecases/get_images_from_assets/get_images_from_assets_usecase_imp.dart';
import 'package:organizze_app/presentation/controllers/add_accounts_page_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AddAccountPageDependencies {
  static List<SingleChildWidget> providers() {
    return [
      Provider(create: (_) => GetImagesFromAssetsDatasourceImp()),
      Provider(
        create: (context) => GetImagesFromAssetsRepositoryImp(
            context.read<GetImagesFromAssetsDatasourceImp>()),
      ),
      Provider(
        create: (context) => GetImagesFromAssetsUsecaseImp(
            context.read<GetImagesFromAssetsRepositoryImp>()),
      ),
      Provider(
        create: (context) => AddAccountPageController(
            context.read<GetImagesFromAssetsUsecaseImp>()),
      )
    ];
  }
}
