import 'package:flutter/material.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';

class UserSettingsPage extends StatelessWidget {
  final UserEntity loggedUser;
  const UserSettingsPage({Key? key, required this.loggedUser})
      : super(key: key);

  static const routeName = '/userSettings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 245),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        elevation: 0,
        toolbarHeight: 40,
      ),
      body: ListView(
        children: [
          buildhomeAppBar(context),
          biuldCard(
            context,
            marginTop: 20,
            itens: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Configure',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0), primary: Colors.black),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.account_balance,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Contas'),
                      )
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0), primary: Colors.black),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.credit_card,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Cartões de Crédito'),
                      )
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0), primary: Colors.black),
                  child: Row(
                    children: const [
                      Icon(Icons.folder),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Categorias'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildhomeAppBar(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 17, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle_outlined,
              size: 90,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                loggedUser.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget biuldCard(BuildContext context,
      {required Column itens, double marginTop = 0}) {
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
}
