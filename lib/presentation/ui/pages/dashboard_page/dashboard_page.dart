import 'package:flutter/material.dart';
import 'package:organizze_app/presentation/ui/pages/dashboard_page/dashboard_widgets.dart/dashboard_page_accounts.dart';
import 'package:organizze_app/presentation/ui/pages/dashboard_page/dashboard_widgets.dart/dashboard_page_balance.dart';
import 'package:organizze_app/presentation/ui/pages/dashboard_page/dashboard_widgets.dart/dashboard_page_credit_cards.dart';
import 'package:organizze_app/presentation/ui/widgets/app_top_app_bar.dart';
import 'package:organizze_app/presentation/ui/widgets/app_white_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

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
                    DashboardAccount(
                      onPressed: () {},
                      accountName: 'accountName',
                      accountIcon: Icons.ads_click,
                      amount: 123341,
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
