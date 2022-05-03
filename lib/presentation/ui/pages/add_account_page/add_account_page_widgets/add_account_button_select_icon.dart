import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:organizze_app/presentation/ui/pages/add_account_page/add_account_page_states/add_account_page_states.dart';
import 'package:organizze_app/presentation/ui/pages/add_account_page/add_account_page_widgets/add_account_modal_bottom_select_icon.dart';

class AddAccountButtonSelecIcon extends StatefulWidget {
  final ValueListenable<Object?> valueListenable;
  const AddAccountButtonSelecIcon({
    Key? key,
    required this.valueListenable,
  }) : super(key: key);

  @override
  State<AddAccountButtonSelecIcon> createState() =>
      _AddAccountButtonSelecIconState();
}

class _AddAccountButtonSelecIconState extends State<AddAccountButtonSelecIcon> {
  Widget defaultIcon = const Icon(Icons.account_balance);
  Widget defaultText = const Text('Selecione um icone');

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
      ),
      child: Row(
        children: [
          defaultIcon,
          const SizedBox(width: 10),
          defaultText,
        ],
      ),
      onPressed: selectIconPressed,
    );
  }

  void selectIconPressed() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (context) {
        return AddAccountModalBottomIcons(
          widget: ValueListenableBuilder(
            valueListenable: widget.valueListenable,
            builder: (context, state, _) {
              if (state is Loading) {
                return const CircularProgressIndicator();
              }

              if (state is Error) {
                return Center(
                  child: Text(state.msg),
                );
              }

              if (state is ImagesLoaded) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.images.length,
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 1),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        state.images[index]['iconPath']
                            .replaceAll('assets/images/accounts_icons/', '')
                            .replaceAll('.png', ''),
                      ),
                      leading: state.images[index]['image'],
                      onTap: () {
                        Navigator.pop(context);
                        setState(() {
                          defaultIcon = state.images[index]['image'];
                          defaultText = Text(
                            state.images[index]['iconPath']
                                .replaceAll('assets/images/accounts_icons/', '')
                                .replaceAll('.png', ''),
                          );
                        });
                      },
                    );
                  },
                );
              }

              return const Center(
                child: Text('Falha ao carregar icones'),
              );
            },
          ),
        );
      },
    );
  }
}
