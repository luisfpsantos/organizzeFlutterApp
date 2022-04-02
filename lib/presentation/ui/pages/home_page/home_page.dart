import 'package:flutter/material.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';

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
                  marginTop: 150,
                  children: [
                    buildBalance(),
                    buildMyAccounts(
                      accounts: [
                        buildAccount(),
                        buildAccount(),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            biuldCard(
              children: [
                const SizedBox(
                  height: 150,
                ),
              ],
            ),
            biuldCard(
              children: [
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
            biuldCard(
              children: [
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
            biuldCard(
              children: [
                const SizedBox(
                  height: 100,
                ),
              ],
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
      height: 200,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 35, 17, 18),
        child: Row(
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
                onPressed: () {},
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
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width - 230, top: 20),
              child: IconButton(
                color: Colors.white,
                iconSize: 30,
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget biuldCard({required List<Widget> children, double marginTop = 0}) {
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
        child: Column(
          children: children,
        ),
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

  Widget buildAccount() {
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
              fontSize: 15,
            ),
          ),
          onTap: () {},
        ),
      ],
    );
  }

  Widget buildMyAccounts({required List<Widget> accounts}) {
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
        Column(
          children: accounts,
        ),
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
