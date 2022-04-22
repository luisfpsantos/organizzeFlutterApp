import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:organizze_app/data/datasources/firebase/get_entries_in_database_datasource_imp.dart';
import 'package:organizze_app/data/repositories/get_entries_in_database_repository_imp.dart';
import 'package:organizze_app/domain/entities/user_entity.dart';
import 'package:organizze_app/domain/entities/user_entries_entity.dart';
import 'package:organizze_app/domain/errors/get_entries_in_database_errors.dart';
import 'package:organizze_app/domain/usecases/get_entries_in_database/get_entries_in_database_usecase_imp.dart';
import 'package:organizze_app/presentation/controllers/account_entries_page_controller.dart';

class AccountEntriesPage extends StatefulWidget {
  final UserEntity loggedUser;
  const AccountEntriesPage({Key? key, required this.loggedUser})
      : super(key: key);

  static const routName = '/accountEntries';

  @override
  State<AccountEntriesPage> createState() => _AccountEntriesPageState();
}

class _AccountEntriesPageState extends State<AccountEntriesPage> {
  late Widget body;

  final AccountEntriesPageController _accountEntriesPageController =
      AccountEntriesPageController(
    GetEntriesInDataBaseUsecaseImp(
      GetEntriesInDataBaseRepositoryImp(
        GetEntriesInDataBaseDatasourceImp(),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();

    body = const Center(
      child: CircularProgressIndicator(),
    );

    _accountEntriesPageController
        .getEntriesInDataBase(loggedUser: widget.loggedUser.user)
        .then(
      (result) {
        result.fold(
          (exception) => {
            if (exception is NoEntriesFound)
              {
                setState(() {
                  body = error(const Text('Nenhum Lançamento Encontrado'));
                })
              }
            else
              {
                setState(() {
                  body = error(const Text('Erro ao buscar os Lançamentos'));
                })
              }
          },
          (success) => setState(() {
            body = entries(success);
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return teste();
  }

  Widget teste() {
    return DefaultTabController(
      initialIndex: 1,
      length: 12,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Lançamentos'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list))
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                icon: Text('Jan'),
              ),
              Tab(
                icon: Text('Fev'),
              ),
              Tab(
                icon: Text('Mar'),
              ),
              Tab(
                icon: Text('Abr'),
              ),
              Tab(
                icon: Text('Mai'),
              ),
              Tab(
                icon: Text('Jun'),
              ),
              Tab(
                icon: Text('Jul'),
              ),
              Tab(
                icon: Text('Ago'),
              ),
              Tab(
                icon: Text('Set'),
              ),
              Tab(
                icon: Text('Out'),
              ),
              Tab(
                icon: Text('Nov'),
              ),
              Tab(
                icon: Text('Dez'),
              ),
            ],
          ),
        ),
        body: body,
      ),
    );
  }

  Widget error(Text text) {
    return Container(
      alignment: Alignment.center,
      child: text,
    );
  }

  Widget entries(List<UserEntryEntity> list) {
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 1,
        );
      },
      itemBuilder: (context, index) {
        return TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.mood_rounded),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(list[index].description),
                      Text(list[index].accountType)
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(list[index].amount.toString()),
                  Text(list[index].status),
                  Text(DateFormat('dd/MM').format(list[index].date))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
