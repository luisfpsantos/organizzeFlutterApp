import 'package:flutter/material.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';
import 'package:organizze_app/presentation/ui/pages/account_entries_page/account_entries_page.dart';
import 'package:organizze_app/presentation/ui/pages/add_antries_page/add_entries_page.dart';
import 'package:organizze_app/presentation/ui/pages/dashboard_page/dashboard_page.dart';
import 'package:organizze_app/presentation/ui/widgets/app_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  final UserEntity loggedUser;
  const HomePage({Key? key, required this.loggedUser}) : super(key: key);

  static const routName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      DashboardPage(loggedUser: widget.loggedUser),
      AccountEntriesPage(loggedUser: widget.loggedUser),
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 245),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddEntriesPage.routName,
            arguments: widget.loggedUser,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: indexPage,
        onTaped: (value) {
          setState(() {
            indexPage = value;
          });
        },
      ),
      body: screens[indexPage],
    );
  }
}
