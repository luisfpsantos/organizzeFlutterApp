import 'package:flutter/material.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';
import '../account_entries_page/account_entries_page.dart';
import '../notification_page/notification_page.dart';
import '../user_settings_page/user_settings_page.dart';

class HomePage extends StatefulWidget {
  final UserEntity loggedUser;
  const HomePage({Key? key, required this.loggedUser}) : super(key: key);

  static const routName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 245),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 30,
        currentIndex: _index,
        onTap: _onTaped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Colors.green,
            ),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows),
            label: 'Transactions',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                buildhomeAppBar(),
                biuldCard(
                  marginTop: 170,
                  itens: Column(
                    children: [
                      buildBalance(),
                      buildMyAccounts(
                        accounts: Column(
                          children: [
                            buildAccount(
                                routName: AccountEntriesPage.routName,
                                arguments: {
                                  'loggedUser': widget.loggedUser,
                                  'accountType': 'Nubank'
                                }),
                            buildAccount(
                                routName: AccountEntriesPage.routName,
                                arguments: {
                                  'loggedUser': widget.loggedUser,
                                  'accountType': 'Inter'
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            biuldCard(
              itens: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Cartões de Crédito',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  biuldCreditCard(),
                  biuldCreditCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildhomeAppBar() {
    return Container(
      color: Colors.blue,
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 50, 17, 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: IconButton(
                    color: Colors.white,
                    padding: const EdgeInsets.all(0),
                    iconSize: 75,
                    icon: const Icon(
                      Icons.account_circle_outlined,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        UserSettingsPage.routeName,
                        arguments: widget.loggedUser,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 10, top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateTime.now().hour <= 18 ? 'Bom Dia' : 'Boa Noite',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(186, 255, 255, 255),
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '${widget.loggedUser.name.split(' ')[0]}!',
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: IconButton(
                color: Colors.white,
                iconSize: 30,
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    NotificationPage.routeName,
                    arguments: widget.loggedUser,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget biuldCard({required Column itens, double marginTop = 0}) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, marginTop, 25, 16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 231, 233, 236),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: itens,
      ),
    );
  }

  Widget buildBalance() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 4,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Saldo Geral',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(200, 85, 85, 85),
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(
                  'R\$ 2.000,89',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Divider(
          color: Color.fromARGB(255, 221, 218, 218),
          thickness: 1,
          height: 25,
        ),
      ],
    );
  }

  Widget buildAccount({required String routName, required Object arguments}) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 0,
          title: const Text('Conta Principal'),
          leading: const Icon(Icons.account_box),
          trailing: const Text(
            'R\$ 2.000,89',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, routName, arguments: arguments);
          },
        ),
      ],
    );
  }

  Widget biuldCreditCard() {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: () {},
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.account_balance),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Banco Inter',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                        'Disponível',
                        style: TextStyle(
                          color: Color.fromARGB(200, 85, 85, 85),
                        ),
                      ),
                    ),
                    Text(
                      'R\$ 5.000,00',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Fatura Atual',
                      style: TextStyle(
                        color: Color.fromARGB(200, 85, 85, 85),
                      ),
                    ),
                  ),
                  Text(
                    'R\$ 5.000,00',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildMyAccounts({required Column accounts}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            'Minhas Contas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        accounts,
        Center(
          child: ElevatedButton(
            child: const Text(
              'Gerenciar Contas',
              style: TextStyle(
                  color: Color.fromARGB(255, 9, 60, 102), fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(double.maxFinite, 0),
              primary: const Color.fromARGB(255, 201, 231, 255),
              elevation: 0,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  void _onTaped(int index) {
    setState(() {
      _index = index;
    });
  }
}
