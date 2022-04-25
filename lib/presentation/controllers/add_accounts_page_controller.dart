import 'package:flutter/cupertino.dart';
import 'package:organizze_app/domain/usecases/get_images_from_assets/get_images_from_assets_usecase.dart';
import 'package:organizze_app/presentation/ui/pages/add_account_page/add_account_page_states/add_account_page_states.dart';

class AddAccountPageController {
  final GetImagesFromAssetsUsecase _getImagesFromAssetsUsecase;
  final pageState = ValueNotifier<AddAccountPageStates>(PageIdle());

  AddAccountPageController(
    this._getImagesFromAssetsUsecase,
  );

  Future getAccountsLogos(String query, BuildContext context) async {
    pageState.value = Loading();
    var result = await _getImagesFromAssetsUsecase(query, context);

    result.fold(
      (exception) => {
        pageState.value = Error('Não foi possivel carregas os icones'),
      },
      (success) => {
        pageState.value = ImagesLoaded(success),
      },
    );
  }
}
