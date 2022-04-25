import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:organizze_app/presentation/ui/pages/add_antries_page/add_entries_page_states/add_entries_page_states.dart';
import 'package:organizze_app/presentation/ui/pages/add_antries_page/add_entries_page_widgets/add_entries_modal_bottom_categories_widget.dart';

class AddEntriesSelectCategoryButton extends StatefulWidget {
  final ValueListenable<Object?> valueListenable;
  const AddEntriesSelectCategoryButton({
    Key? key,
    required this.valueListenable,
  }) : super(key: key);

  @override
  State<AddEntriesSelectCategoryButton> createState() =>
      _AddEntriesSelectCategoryButtonState();
}

class _AddEntriesSelectCategoryButtonState
    extends State<AddEntriesSelectCategoryButton> {
  Widget defaultCategory = ListTile(
    title: const Text('Outros'),
    contentPadding: const EdgeInsets.all(0),
    minLeadingWidth: 0,
    minVerticalPadding: 0,
    leading: Image.asset(
      'assets/images/categories_icons/outros.png',
      scale: 2,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 0)),
      child: defaultCategory,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          context: context,
          builder: (context) {
            return AddEntriesModalBottomCategories(
              widget: ValueListenableBuilder(
                valueListenable: widget.valueListenable,
                builder: (context, state, _) {
                  if (state is Error) {
                    return Center(child: Text(state.msg));
                  }

                  if (state is Loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is CategoriesSuccess) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.list.length,
                      separatorBuilder: (context, index) {
                        return const Divider(thickness: 1);
                      },
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.list[index].name),
                          leading: Image.asset(state.list[index].iconPath),
                          onTap: () {
                            setState(() {
                              defaultCategory = ListTile(
                                title: Text(state.list[index].name),
                                minLeadingWidth: 0,
                                minVerticalPadding: 0,
                                contentPadding: const EdgeInsets.all(0),
                                leading: Image.asset(
                                  state.list[index].iconPath,
                                  scale: 2,
                                ),
                              );
                            });
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  }

                  return const Center(
                    child: Text('Erro ao Carregar categorias'),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
