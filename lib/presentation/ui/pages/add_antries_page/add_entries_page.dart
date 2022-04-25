import 'package:flutter/material.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';
import 'package:organizze_app/presentation/controllers/add_entries_page_controller.dart';
import 'package:organizze_app/presentation/ui/pages/add_antries_page/add_entries_page_states/add_entries_page_states.dart';
import 'package:organizze_app/presentation/ui/pages/add_antries_page/add_entries_page_widgets/add_entries_input_description_widget.dart';
import 'package:organizze_app/presentation/ui/pages/add_antries_page/add_entries_page_widgets/add_entries_select_category_widget.dart';
import 'package:organizze_app/presentation/ui/pages/add_antries_page/add_entries_page_widgets/add_entries_select_type_entry_widget.dart';

import 'package:provider/provider.dart';

class AddEntriesPage extends StatefulWidget {
  final UserEntity loggedUser;
  const AddEntriesPage({Key? key, required this.loggedUser}) : super(key: key);

  static const routName = '/addEntries';

  @override
  State<AddEntriesPage> createState() => _AddEntriesPageState();
}

class _AddEntriesPageState extends State<AddEntriesPage> {
  late final AddEntriesPageController _addEntriesPageController;
  final _entryAmountController = TextEditingController();
  final _entryDescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addEntriesPageController = context.read<AddEntriesPageController>();
    _addEntriesPageController.getCategories(widget.loggedUser.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _addEntriesPageController.selectState,
            builder: (context, state, _) {
              if (state is IncomeActive) {
                return AddEntryTypeSelect(
                  controller: _entryAmountController,
                  expensePressed: expensePressed,
                  incomePressed: incomePressed,
                  backgroundColor: state.backgroundColor,
                  textExpenseColor: state.expenseDefault,
                  textIncomeColor: state.incomeActive,
                  prefixSimbol: '+',
                  thumbIcon: state.thumb,
                  thumbPressed: thumbPressed,
                );
              }

              if (state is ExpenseActive) {
                return AddEntryTypeSelect(
                  controller: _entryAmountController,
                  expensePressed: expensePressed,
                  incomePressed: incomePressed,
                  backgroundColor: state.backgroundColor,
                  textExpenseColor: state.expenseActive,
                  textIncomeColor: state.incomeDefault,
                  prefixSimbol: '-',
                  thumbIcon: state.thumb,
                  thumbPressed: thumbPressed,
                );
              }

              return const Center(
                child: Text('Erro ao carregar Pagina'),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Descrição'),
                AddEntriesInputDescription(
                  controller: _entryDescriptionController,
                ),
                const Divider(thickness: 1),
                const SizedBox(height: 5),
                const Text('Categoria'),
                AddEntriesSelectCategoryButton(
                  valueListenable: _addEntriesPageController.pageState,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void incomePressed() {
    _addEntriesPageController.selectState.value = IncomeActive(Icons.thumb_up);
  }

  void expensePressed() {
    _addEntriesPageController.selectState.value = ExpenseActive(Icons.thumb_up);
  }

  void thumbPressed() {
    if (_addEntriesPageController.selectState.value is IncomeActive) {
      var a = (_addEntriesPageController.selectState.value as IncomeActive);
      if (a.thumb == Icons.thumb_up) {
        _addEntriesPageController.selectState.value =
            IncomeActive(Icons.thumb_down);
      }
      if (a.thumb == Icons.thumb_down) {
        _addEntriesPageController.selectState.value =
            IncomeActive(Icons.thumb_up);
      }
    }

    if (_addEntriesPageController.selectState.value is ExpenseActive) {
      var a = (_addEntriesPageController.selectState.value as ExpenseActive);
      if (a.thumb == Icons.thumb_up) {
        _addEntriesPageController.selectState.value =
            ExpenseActive(Icons.thumb_down);
      }
      if (a.thumb == Icons.thumb_down) {
        _addEntriesPageController.selectState.value =
            ExpenseActive(Icons.thumb_up);
      }
    }
  }
}
