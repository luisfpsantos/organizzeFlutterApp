import 'package:flutter/material.dart';
import 'package:organizze_app/presentation/controllers/add_entries_page_controller.dart';
import 'package:organizze_app/presentation/ui/pages/add_antries_page/add_entries_page_states/add_entries_page_states.dart';
import 'package:organizze_app/presentation/ui/pages/add_antries_page/add_entries_widgets/add_entries_select_type_entry_widget.dart';
import 'package:provider/provider.dart';

class AddEntriesPage extends StatefulWidget {
  const AddEntriesPage({Key? key}) : super(key: key);

  @override
  State<AddEntriesPage> createState() => _AddEntriesPageState();
}

class _AddEntriesPageState extends State<AddEntriesPage> {
  late final AddEntriesPageController _addEntriesPageController;
  final _entryAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _addEntriesPageController = context.read<AddEntriesPageController>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  thumbPressed: thumbPressed);
            }

            state as ExpenseActive;
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
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Descrição'),
              const TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Adicione a descrição',
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.create,
                    size: 20,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Categoria'),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    context: context,
                    builder: (context) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height - 50,
                          minHeight: 200,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              height: 5,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: ListView(
                                shrinkWrap: true,
                                children: const [
                                  ListTile(
                                    title: Text('sdfsd'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.other_houses),
                    Text('Outros'),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
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
