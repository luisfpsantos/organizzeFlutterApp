import 'package:flutter/material.dart';
import 'package:organizze_app/domain/usecases/add_entries/add_entries_usecase.dart';
import 'package:organizze_app/presentation/ui/pages/add_antries_page/add_entries_page_states/add_entries_page_states.dart';

class AddEntriesPageController {
  final AddEntriesUsecase _addEntriesUsecase;
  final pageState = ValueNotifier<AddEntriesPageStates>(PageIdle());
  final selectState =
      ValueNotifier<AddEntriesPageStates>(ExpenseActive(Icons.thumb_up));

  AddEntriesPageController(this._addEntriesUsecase);

  Future addEntry(Map<String, dynamic> entry, String user) async {
    pageState.value = Loading();

    var result = await _addEntriesUsecase(entry, user);

    result.fold(
      (exception) => {
        pageState.value = Error('Falha ao adicionar Entrada'),
      },
      (success) => {
        pageState.value = Success(),
      },
    );
  }
}
