import 'package:flutter/material.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';
import 'package:organizze_app/presentation/controllers/add_accounts_page_controller.dart';
import 'package:organizze_app/presentation/ui/pages/add_account_page/add_account_page_states/add_account_page_states.dart';
import 'package:organizze_app/presentation/ui/pages/add_account_page/add_account_page_widgets/add_account_modal_bottom_create_account.dart';
import 'package:organizze_app/presentation/ui/pages/add_account_page/add_account_page_widgets/add_account_modal_bottom_select_icon.dart';
import 'package:provider/provider.dart';

class AddAccountPage extends StatefulWidget {
  final UserEntity loggedUser;
  const AddAccountPage({
    Key? key,
    required this.loggedUser,
  }) : super(key: key);

  static const routName = '/addAccount';

  @override
  State<AddAccountPage> createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  late final AddAccountPageController _addAccountPageController;
  Widget defaultIcon = const Icon(Icons.account_balance);

  @override
  void initState() {
    super.initState();
    _addAccountPageController = context.read<AddAccountPageController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contas'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: addAccountPressed,
          ),
        ],
      ),
    );
  }

  void addAccountPressed() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (context) {
        return AddAccountModalBottom(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nome da conta'),
              const TextField(
                decoration: InputDecoration(hintText: 'Digite o nome da conta'),
              ),
              const SizedBox(height: 15),
              const Text('Icone da conta'),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                ),
                child: Row(
                  children: [
                    defaultIcon,
                    const SizedBox(width: 10),
                    const Text('Selecione um icone'),
                  ],
                ),
                onPressed: selectIconPressed,
              )
            ],
          ),
        );
      },
    );
  }

  void selectIconPressed() {
    _addAccountPageController.getAccountsLogos(
      'assets/images/accounts_icons/',
      context,
    );

    showModalBottomSheet(
      isScrollControlled: true,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      context: context,
      builder: (context) {
        return AddAccountModalBottomIcons(
          widget: ValueListenableBuilder(
            valueListenable: _addAccountPageController.pageState,
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
                        setState(() {
                          defaultIcon = state.images[index]['image'];
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
