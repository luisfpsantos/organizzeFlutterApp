import 'package:flutter/material.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';
import 'package:organizze_app/presentation/ui/pages/add_account_page/add_account_page.dart';
import 'package:organizze_app/presentation/ui/pages/dashboard_page/dashboard_widgets.dart/dashboard_page_balance.dart';
import 'package:organizze_app/presentation/ui/pages/dashboard_page/dashboard_widgets.dart/dashboard_page_button_manage_my_accounts.dart';
import 'package:organizze_app/presentation/ui/pages/dashboard_page/dashboard_widgets.dart/dashboard_page_credit_cards.dart';
import 'package:organizze_app/presentation/ui/widgets/app_top_app_bar.dart';
import 'package:organizze_app/presentation/ui/widgets/app_white_card.dart';

class DashboardPage extends StatefulWidget {
  final UserEntity loggedUser;
  const DashboardPage({Key? key, required this.loggedUser}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    print('carreguei a dash');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              const AppTopAppBar(),
              AppWhiteCard(
                marginBottom: 10,
                marginHorizontal: 16,
                marginTop: 170,
                items: Column(
                  children: [
                    const DashboardBalance(
                      balanceIndicatorCollor: Colors.red,
                      amount: -29,
                    ),
                    DashboardButtonManageMyaccounts(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AddAccountPage.routName,
                          arguments: widget.loggedUser,
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
          AppWhiteCard(
            marginBottom: 10,
            marginHorizontal: 16,
            items: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Cartões de Crédito',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                DashboardCreditCard(
                  bankName: 'BankName',
                  amountAvailable: 2000,
                  currentInvoice: 300,
                  bankIcon: Icons.food_bank,
                  amountAvailableColor: Colors.amberAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
