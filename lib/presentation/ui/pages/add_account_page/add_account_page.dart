import 'package:flutter/material.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';
import 'package:organizze_app/presentation/controllers/add_accounts_page_controller.dart';
import 'package:organizze_app/presentation/ui/pages/add_account_page/add_account_page_widgets/add_account_button_select_icon.dart';
import 'package:organizze_app/presentation/ui/pages/add_account_page/add_account_page_widgets/add_account_modal_bottom_create_account.dart';
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

  @override
  void initState() {
    super.initState();
    _addAccountPageController = context.read<AddAccountPageController>();
    _addAccountPageController.getAccountsLogos(
        'assets/images/accounts_icons/', context);
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
              AddAccountButtonSelecIcon(
                  valueListenable: _addAccountPageController.pageState),
            ],
          ),
        );
      },
    );
  }
}
